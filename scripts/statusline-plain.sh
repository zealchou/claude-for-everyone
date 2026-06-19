#!/bin/bash
# ─────────────────────────────────────────────────────────────
# 白話狀態列（三行版）—— 把畫面最下方那行資訊，全部換成「看得懂的人話」。
#
# 原本預設的狀態列會顯示一堆術語（model、context %、token…），
# 新手根本看不懂。這支腳本只挑「你真正需要知道的」，再翻成白話，
# 並且分成「看得清楚」的三行（擠成一長行時，後面會被畫面切掉看不到）：
#   第 1 行・身份 → 現在用哪個助理大腦、正在處理哪個資料夾
#   第 2 行・對話 → 這次對話的記憶空間用了多少、距離自動整理還剩多少
#   第 3 行・額度 → （Pro / Max 才有）這 5 小時 / 7 天的額度用了多少
#
# Claude Code 會自動把一包資訊（JSON）餵進來，這支腳本挑重點，
# 每個 echo 就是狀態列的一行（這是官方支援的多行寫法）。
# 你完全不用懂下面在做什麼，照「開始使用」說明裝上去就會自己運作。
# ─────────────────────────────────────────────────────────────
set -uo pipefail
input=$(cat)

# 小工具：從那包資訊裡挑出某個欄位
j() { printf '%s' "$input" | jq -r "$1" 2>/dev/null; }

MODEL=$(j '.model.display_name // empty');   [ -z "$MODEL" ] && MODEL="?"
DIRPATH=$(j '.workspace.current_dir // empty')
FOLDER="${DIRPATH##*/}";                     [ -z "$FOLDER" ] && FOLDER="家目錄"
# 把百分比夾在 0~100（避免極端 JSON 顯示出 150%、250% 這種怪數字）
clamp() { v="$1"; case "$v" in ''|*[!0-9]*) echo ""; return;; esac; [ "$v" -gt 100 ] && v=100; [ "$v" -lt 0 ] && v=0; echo "$v"; }

CTX=$(j '.context_window.used_percentage // 0' | cut -d. -f1)
CTX=$(clamp "$CTX"); [ -z "$CTX" ] && CTX=0
# 距離自動整理還剩多少（會越用越少）。沒給就用 100 - 已用 推算
REMAIN=$(j '.context_window.remaining_percentage // empty' | cut -d. -f1)
REMAIN=$(clamp "$REMAIN"); [ -z "$REMAIN" ] && REMAIN=$((100 - CTX))
RL=$(clamp "$(j '.rate_limits.five_hour.used_percentage // empty' | cut -d. -f1)")
RL7=$(clamp "$(j '.rate_limits.seven_day.used_percentage // empty' | cut -d. -f1)")

# 助理大腦 → 翻成白話標籤
case "$MODEL" in
  *Opus*)   BRAIN="Opus（最聰明）" ;;
  *Sonnet*) BRAIN="Sonnet（又快又好）" ;;
  *Haiku*)  BRAIN="Haiku（反應最快）" ;;
  *Fable*)  BRAIN="Fable（最新款）" ;;
  *)        BRAIN="$MODEL" ;;
esac

# 對話的記憶空間 → 用白話形容
if   [ "$CTX" -lt 50 ]; then CTXW="充裕"
elif [ "$CTX" -lt 80 ]; then CTXW="過半"
else                         CTXW="快滿了，建議開新對話"
fi

# 距離自動整理的剩餘量 → 白話形容（越少越要注意）
if   [ "$REMAIN" -gt 50 ]; then REMW="很充裕"
elif [ "$REMAIN" -gt 20 ]; then REMW="還行"
else                            REMW="快觸發了，等等它會自動打包濃縮"
fi

# 小工具：把額度百分比翻成白話形容
quota_word() {
  if   [ "$1" -lt 60 ]; then echo "還很夠"
  elif [ "$1" -lt 85 ]; then echo "用得差不多了"
  else                       echo "快用完，過一會兒會自動恢復"
  fi
}

# ── 第 1 行・身份：用哪個助理大腦、正在處理哪個資料夾 ──
echo "🧠 助理大腦：${BRAIN}   ·   📁 正在處理：${FOLDER}"

# ── 第 2 行・對話：記憶空間用了多少、距離自動整理還剩多少 ──
echo "💭 對話空間：用了 ${CTX}%（${CTXW}）   ·   🔄 距離自動整理：還剩 ${REMAIN}%（${REMW}）"

# ── 第 3 行・額度：5 小時 / 7 天用量（只有 Pro / Max 才會有這些數字）──
LINE3=""
if [ -n "${RL:-}" ]; then
  LINE3="⏳ 這5小時用量：${RL}%（$(quota_word "$RL")）"
fi
if [ -n "${RL7:-}" ]; then
  [ -n "$LINE3" ] && LINE3="$LINE3   ·   "
  LINE3="${LINE3}📅 這7天用量：${RL7}%（$(quota_word "$RL7")）"
fi
# 免費方案沒有額度數字 → 仍保留第三行，給一句溫和提示，畫面維持三行不破版
[ -z "$LINE3" ] && LINE3="⏳ 額度用量：你目前的方案不顯示用量數字（免費方案的正常現象）"
echo "$LINE3"
