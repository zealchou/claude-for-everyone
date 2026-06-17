#!/bin/bash
# ─────────────────────────────────────────────────────────────
# （選用）把檔案傳到你的 Telegram —— 方便 Claude 幫你整理好東西後，
#         直接傳到手機或某個群組，不用自己跑去電腦拿。
#
# ★ 怎麼設定：
#   1. 在 Telegram 找 @BotFather 申請一支機器人，拿到一串「TOKEN」。
#   2. 把機器人加進你要收檔案的對話 / 群組，拿到該對話的「CHAT_ID」。
#      （不會拿沒關係——直接把這兩個需求丟給 Claude，它會一步步帶你弄。）
#   3. 把 TOKEN、CHAT_ID 填進下面兩行（或設成環境變數，比較安全）。
#
# 用法： notify-telegram.sh <檔案路徑> [說明文字]
# ─────────────────────────────────────────────────────────────
set -uo pipefail

# ↓↓↓ 填這兩個（建議改用環境變數，不要把 TOKEN 直接寫死推上 GitHub）↓↓↓
TOKEN="${TELEGRAM_BOT_TOKEN:-}"   # 例： export TELEGRAM_BOT_TOKEN=123456:abcdef...
CHAT_ID="${TELEGRAM_CHAT_ID:-}"   # 例： export TELEGRAM_CHAT_ID=-1001234567890
# ↑↑↑ 填這兩個 ↑↑↑

FILE="${1:-}"; CAP="${2:-}"

[ -n "$TOKEN" ]   || { echo "✗ 還沒設定 TELEGRAM_BOT_TOKEN"; exit 1; }
[ -n "$CHAT_ID" ] || { echo "✗ 還沒設定 TELEGRAM_CHAT_ID"; exit 1; }
[ -f "$FILE" ]    || { echo "✗ 找不到檔案： $FILE"; exit 1; }

curl -sS -m 120 \
  -F "chat_id=$CHAT_ID" \
  -F "document=@${FILE};filename=$(basename "$FILE")" \
  -F "caption=$CAP" \
  "https://api.telegram.org/bot${TOKEN}/sendDocument" \
  | python3 -c "import sys,json
d=json.load(sys.stdin); r=d.get('result',{})
print('✓ 已送出（訊息編號',r.get('message_id'),'）') if d.get('ok') else print('✗ 失敗：',d.get('description'))"
