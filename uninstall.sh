#!/bin/bash
# ─────────────────────────────────────────────────────────────
# 一鍵還原 —— 退回安裝「新手友善包」之前的原本設定。
#
# 做的事：
#   1. 把 settings.json 與 CLAUDE.md 還原成安裝前備份的那一份
#   2. 移除放進去的小程式（白話狀態列、安全鎖）與指令
#
# 用法： bash uninstall.sh
# ─────────────────────────────────────────────────────────────
set -euo pipefail

CLAUDE_DIR="$HOME/.claude"
SETTINGS="$CLAUDE_DIR/settings.json"
CLAUDEMD="$CLAUDE_DIR/CLAUDE.md"
MARKER="$CLAUDE_DIR/.newbie-kit"

if [ ! -f "$MARKER" ]; then
  echo "⚠️  找不到安裝紀錄，可能沒裝過、或已經還原過了。沒有任何變更。"
  exit 0
fi
BK="$(cat "$MARKER")"

echo "↩️  步驟 1／3：還原原本的設定檔…"
if [ -f "$BK/settings.json" ]; then
  cp "$BK/settings.json" "$SETTINGS"
  echo "   settings.json 已還原成安裝前。"
else
  rm -f "$SETTINGS"
  echo "   你原本沒有 settings.json，已清空回最初狀態。"
fi

echo "↩️  步驟 2／3：還原記憶 / 指令檔，並移除放進去的東西…"
if [ -f "$BK/CLAUDE.md" ]; then
  cp "$BK/CLAUDE.md" "$CLAUDEMD"
  echo "   CLAUDE.md 已還原成安裝前。"
else
  rm -f "$CLAUDEMD"
  echo "   你原本沒有 CLAUDE.md，已移除。"
fi
rm -f "$CLAUDE_DIR/statusline-plain.sh"
rm -f "$CLAUDE_DIR/hooks/folder-guard.sh"
for f in 習慣盤點 出廠檢查 設定面板 說明; do
  rm -f "$CLAUDE_DIR/commands/$f.md"
done

echo "🧹 步驟 3／3：清掉安裝紀錄…"
rm -f "$MARKER"

echo ""
echo "✅ 已退回原本設定。請「重開一次 Claude Code」讓變更生效。"
