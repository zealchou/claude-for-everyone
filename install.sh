#!/bin/bash
# ─────────────────────────────────────────────────────────────
# 一鍵安裝（會先「拍照備份」你原本的設定，之後隨時能完整還原）
#
# 做的事：
#   1. 備份你原本的 settings.json 與 CLAUDE.md
#   2. 放入小程式（白話狀態列、資料夾安全鎖）與指令（/設定面板、/說明…）
#   3. 把新手友善設定「合併」進你的設定（保留你原本的 model / 主題 / 既有 hook）
#   4. 放入白話記憶與「會自己長大 / 出廠檢查」的長期指令
#
# 用法： bash install.sh      還原： bash uninstall.sh
# ─────────────────────────────────────────────────────────────
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_DIR="$HOME/.claude"
SETTINGS="$CLAUDE_DIR/settings.json"
CLAUDEMD="$CLAUDE_DIR/CLAUDE.md"
EX="$HERE/settings.example.json"
MARKER="$CLAUDE_DIR/.newbie-kit"

# 防止重複安裝（避免把乾淨的備份覆蓋掉）
if [ -f "$MARKER" ]; then
  echo "ℹ️  看起來已經安裝過新手友善包了。"
  echo "   要重裝，請先執行  bash uninstall.sh  退回原本設定，再裝一次。"
  exit 0
fi

mkdir -p "$CLAUDE_DIR/hooks" "$CLAUDE_DIR/commands" "$CLAUDE_DIR/scripts" "$CLAUDE_DIR/backups"
STAMP="$(date +%Y%m%d-%H%M%S)"
BK="$CLAUDE_DIR/backups/newbie-kit-$STAMP"
mkdir -p "$BK"

echo "📸 步驟 1／4：備份你原本的設定（之後能完整還原）…"
[ -f "$SETTINGS" ] && cp "$SETTINGS" "$BK/settings.json"
[ -f "$CLAUDEMD" ] && cp "$CLAUDEMD" "$BK/CLAUDE.md"
echo "   備份位置：$BK"

# 合併設定需要 jq；若缺、且你已有設定檔，為了不蓋掉你的設定先停下來
if [ -f "$SETTINGS" ] && ! command -v jq >/dev/null 2>&1; then
  echo ""
  echo "⚠️  你電腦缺一個小工具「jq」，沒有它就無法安全地『合併』你原本的設定。"
  echo "   為了不蓋掉你既有的設定，已暫停安裝（你的設定完全沒被動到）。"
  echo "   解法：請 Claude 幫你裝 jq（mac 通常是 brew install jq），裝好後再跑一次 bash install.sh。"
  rm -rf "$BK"
  exit 1
fi

echo "🧩 步驟 2／4：放入小程式與指令（白話狀態列、安全鎖、設定面板…）…"
cp "$HERE/scripts/statusline-plain.sh" "$CLAUDE_DIR/statusline-plain.sh"
cp "$HERE/scripts/notify-telegram.sh"  "$CLAUDE_DIR/scripts/notify-telegram.sh"
cp "$HERE/hooks/folder-guard.sh"       "$CLAUDE_DIR/hooks/folder-guard.sh"
chmod +x "$CLAUDE_DIR/statusline-plain.sh" "$CLAUDE_DIR/scripts/notify-telegram.sh" "$CLAUDE_DIR/hooks/folder-guard.sh"
cp "$HERE/commands/"*.md "$CLAUDE_DIR/commands/"

echo "⚙️  步驟 3／4：套用新手友善設定（保留你原本的設定，只把我們的加上去）…"
if [ -f "$SETTINGS" ]; then
  jq -s '
    .[0] as $o | .[1] as $n
    | ($o * $n)
    | .permissions.allow = ((($o.permissions.allow // []) + ($n.permissions.allow // [])) | unique)
    | .hooks = (
        reduce (["UserPromptSubmit","PreToolUse","PostToolUse","Stop","Notification"]|.[]) as $k
          ( ($o.hooks // {});
            .[$k] = ((($o.hooks // {})[$k] // []) + (($n.hooks // {})[$k] // [])) )
        | with_entries(select(.value | length > 0))
      )
  ' "$SETTINGS" "$EX" > "$SETTINGS.tmp" && mv "$SETTINGS.tmp" "$SETTINGS"
else
  cp "$EX" "$SETTINGS"
fi

echo "🧠 步驟 4／4：放入白話記憶與「會自己長大 / 出廠檢查」的長期指令…"
if [ -f "$CLAUDEMD" ]; then
  printf '\n\n' >> "$CLAUDEMD"
  cat "$HERE/memory/CLAUDE.example.md" >> "$CLAUDEMD"
else
  cp "$HERE/memory/CLAUDE.example.md" "$CLAUDEMD"
fi

printf '%s\n' "$BK" > "$MARKER"

echo ""
echo "✅ 完成！請「重開一次 Claude Code」讓設定生效。"
echo "   裝好後可以打  /說明  看有哪些功能，或打  /設定面板  逐條開關。"
echo "   不喜歡的話，隨時執行  bash uninstall.sh  一鍵退回原本設定。"

# 白話狀態列需要 jq 才會顯示；若沒裝，提醒使用者（避免狀態列默默空白）
command -v jq >/dev/null 2>&1 || {
  echo ""
  echo "ℹ️  小提醒：白話狀態列需要一個小工具「jq」才會顯示。你電腦目前好像沒有，"
  echo "   重開後若狀態列沒出現，請跟 Claude 說「幫我裝 jq」就好。"
}
