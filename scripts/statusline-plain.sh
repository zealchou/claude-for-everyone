#!/bin/bash
# ─────────────────────────────────────────────────────────────
# 白話狀態列 —— 把畫面最下方那行資訊，全部換成「看得懂的人話」。
#
# 原本預設的狀態列會顯示一堆術語（model、context %、token…），
# 新手根本看不懂。這支腳本只挑「你真正需要知道的」，再翻成白話：
#   ・現在用哪個助理大腦（聰明 / 快）
#   ・正在處理哪個資料夾
#   ・這次對話的「記憶空間」用了多少（快滿了會提醒你開新對話）
#   ・（Pro / Max 才有）這 5 小時的額度用了多少
#
# Claude Code 會自動把一包資訊（JSON）餵進來，這支腳本挑重點印出來。
# 你完全不用懂下面在做什麼，照「開始使用」說明裝上去就會自己運作。
# ─────────────────────────────────────────────────────────────
set -uo pipefail
input=$(cat)

# 小工具：從那包資訊裡挑出某個欄位
j() { printf '%s' "$input" | jq -r "$1" 2>/dev/null; }

MODEL=$(j '.model.display_name');           [ -z "$MODEL" ] && MODEL="?"
DIRPATH=$(j '.workspace.current_dir')
FOLDER="${DIRPATH##*/}";                     [ -z "$FOLDER" ] && FOLDER="家目錄"
CTX=$(j '.context_window.used_percentage // 0' | cut -d. -f1)
case "$CTX" in ''|*[!0-9]*) CTX=0 ;; esac
# 距離自動整理還剩多少（會越用越少）。沒給就用 100 - 已用 推算
REMAIN=$(j '.context_window.remaining_percentage // empty' | cut -d. -f1)
case "${REMAIN:-}" in ''|*[!0-9]*) REMAIN=$((100 - CTX)) ;; esac
[ "$REMAIN" -lt 0 ] && REMAIN=0
RL=$(j '.rate_limits.five_hour.used_percentage // empty' | cut -d. -f1)
case "${RL:-}" in *[!0-9]*) RL="" ;; esac
RL7=$(j '.rate_limits.seven_day.used_percentage // empty' | cut -d. -f1)
case "${RL7:-}" in *[!0-9]*) RL7="" ;; esac

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

LINE="🧠 助理大腦：${BRAIN}   ·   📁 正在處理：${FOLDER}   ·   💭 對話空間：用了 ${CTX}%（${CTXW}）   ·   🔄 距離自動整理：還剩 ${REMAIN}%（${REMW}）"

# 用量 / 額度（只有 Pro / Max 訂閱才會有這些數字，沒有就不顯示）
# 小工具：把百分比翻成白話形容
quota_word() {
  if   [ "$1" -lt 60 ]; then echo "還很夠"
  elif [ "$1" -lt 85 ]; then echo "用得差不多了"
  else                       echo "快用完，過一會兒會自動恢復"
  fi
}

if [ -n "${RL:-}" ]; then
  LINE="$LINE   ·   ⏳ 這5小時用量：${RL}%（$(quota_word "$RL")）"
fi
if [ -n "${RL7:-}" ]; then
  LINE="$LINE   ·   📅 這7天用量：${RL7}%（$(quota_word "$RL7")）"
fi

echo "$LINE"
