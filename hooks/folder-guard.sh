#!/bin/bash
# ─────────────────────────────────────────────────────────────────────────────
# 資料夾安全鎖（PreToolUse hook）
#
# 用途：把你「絕對不想被改到」的資料夾保護起來——讀取沒問題，
#       但只要 Claude 想「修改 / 刪除 / 搬移 / 覆蓋」裡面的東西，
#       這支腳本就會直接攔下來，避免誤動到重要檔案。
#
# ★ 怎麼設定（改下面兩行就好）：
#   PROTECTED_DIR  = 你要保護的資料夾（留空＝不保護任何東西，安全的預設值）
#   WRITABLE_SUB   = 保護區裡「唯一允許寫入」的子資料夾（沒有就留空）
#
#   例：保護整顆外接硬碟，只留一個「暫存」夾可以寫——
#   PROTECTED_DIR="/Volumes/MyDisk"
#   WRITABLE_SUB="/Volumes/MyDisk/暫存"
#
# 預設兩行都留空 → 這支腳本什麼都不擋，裝上去也很安全；等你想保護
# 某個資料夾時，再把路徑填進去即可。
# ─────────────────────────────────────────────────────────────────────────────
set -uo pipefail

# ↓↓↓ 只要改這兩行 ↓↓↓
PROTECTED_DIR=""      # 例： "/Volumes/MyDisk"
WRITABLE_SUB=""       # 例： "/Volumes/MyDisk/暫存"
# ↑↑↑ 只要改這兩行 ↑↑↑

# 沒設定保護資料夾 → 直接放行（安全的預設）
[ -z "$PROTECTED_DIR" ] && exit 0

# 去掉結尾斜線（含手滑多打的 // ），避免路徑比對失準、保護失效
while [ "${PROTECTED_DIR%/}" != "$PROTECTED_DIR" ]; do PROTECTED_DIR="${PROTECTED_DIR%/}"; done
while [ "${WRITABLE_SUB%/}"  != "$WRITABLE_SUB"  ]; do WRITABLE_SUB="${WRITABLE_SUB%/}";  done
# 若被去成空字串（例如只填了 "/"），視為沒有有效保護設定、直接放行，
# 避免把整顆磁碟誤當保護區而擋掉所有寫入
[ -z "$PROTECTED_DIR" ] && exit 0

input=$(cat)
tool=$(printf '%s' "$input" | jq -r '.tool_name // ""' 2>/dev/null)
# 把保護路徑轉成「安全的正則」：所有非英數字元一律跳脫，避免路徑含 + ( ) ? 等特殊字元時整條正則壞掉導致保護失效
PROT_RE=$(printf '%s' "$PROTECTED_DIR" | sed 's/[^[:alnum:]]/\\&/g')

deny() {
  jq -n --arg r "$1" '{hookSpecificOutput:{hookEventName:"PreToolUse",permissionDecision:"deny",permissionDecisionReason:$r}}'
  exit 0
}

# 路徑在保護區內、且不在「允許寫入子夾」內 → 受保護
is_protected_path() {
  local p="$1"
  case "$p" in
    "$PROTECTED_DIR"|"$PROTECTED_DIR"/*)
      if [ -n "$WRITABLE_SUB" ]; then
        case "$p" in
          "$WRITABLE_SUB"|"$WRITABLE_SUB"/*) return 1 ;;  # 允許寫入
        esac
      fi
      return 0 ;;   # 保護區其他地方
    *) return 1 ;;  # 不在保護區
  esac
}

case "$tool" in
  Write|Edit|MultiEdit|NotebookEdit)
    fp=$(printf '%s' "$input" | jq -r '.tool_input.file_path // .tool_input.notebook_path // ""' 2>/dev/null)
    case "$fp" in
      *..*) case "$fp" in "$PROTECTED_DIR"*) deny "資料夾安全鎖：路徑含 .. 有越界風險，已攔截（ ${fp} ）" ;; esac ;;
    esac
    if is_protected_path "$fp"; then
      deny "資料夾安全鎖：「 ${PROTECTED_DIR} 」是唯讀保護區，不允許修改 / 刪除這個檔案： ${fp}"
    fi
    ;;

  Bash)
    cmd=$(printf '%s' "$input" | jq -r '.tool_input.command // ""' 2>/dev/null)
    # 指令沒提到保護區 → 與我們無關，放行
    printf '%s' "$cmd" | grep -qF "$PROTECTED_DIR" || exit 0
    # 把「允許寫入子夾」遮蔽掉；若還殘留保護區路徑＝有動到受保護的地方
    # 只遮蔽「子夾後面接 / 或空白/引號/結尾」的情況，避免 tmpEVIL 這種前綴撞名繞過保護
    if [ -n "$WRITABLE_SUB" ]; then
      # 同樣把所有非英數字元跳脫，避免特殊字元讓 sed 壞掉
      WS_RE=$(printf '%s' "$WRITABLE_SUB" | sed 's/[^[:alnum:]]/\\&/g')
      stripped=$(printf '%s' "$cmd" | sed -E "s#${WS_RE}(/|[[:space:]]|\"|'|\$)#__ALLOWED__\1#g" 2>/dev/null) || stripped="$cmd"
      # 萬一遮蔽過程出意外變空字串，保守起見當作「有動到保護區」（fail-closed，寧可多擋）
      [ -z "$stripped" ] && [ -n "$cmd" ] && stripped="$cmd"
    else
      stripped="$cmd"
    fi
    printf '%s' "$stripped" | grep -qF "$PROTECTED_DIR" || exit 0
    # 明確的「破壞性動詞」（刪除 / 搬移 / 覆蓋 / 改權限…）
    if printf '%s' "$stripped" | grep -qiE '(\brm\b|\brmdir\b|\bunlink\b|\bshred\b|\bmv\b|\bcp\b|\bdd\b|\btruncate\b|\bditto\b|\brsync\b|\bchmod\b|\bchown\b|\bchflags\b|\bmkdir\b|\btouch\b|\bln\b|\btee\b|\btrash\b|sed[[:space:]]+-i|perl[[:space:]].*-i|-delete\b|-exec(dir)?\b)'; then
      deny "資料夾安全鎖：偵測到對保護區的寫入 / 刪除 / 搬移指令，已攔截。要讀取沒問題，但這個資料夾禁止修改。"
    fi
    # 寫入式重導向（把資料寫進保護區）：一般 > >>、以及 fd 重導向 1> 2> &> 寫入保護區
    # （注意：$PROT_RE 開頭一定是 / 或英數，不會誤判 2>&1 這種非檔案重導向）
    if printf '%s' "$stripped" | grep -qE "(^|[^0-9&>])>[>|]?[[:space:]]*[\"']?$PROT_RE" \
       || printf '%s' "$stripped" | grep -qE "([0-9]+>|&>)[>]?[[:space:]]*[\"']?$PROT_RE"; then
      deny "資料夾安全鎖：偵測到把資料寫入保護區，已攔截。這個資料夾只能讀、不能寫。"
    fi
    ;;
esac

exit 0
