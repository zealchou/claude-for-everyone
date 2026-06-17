#!/bin/bash
# ─────────────────────────────────────────────────────────────
# 一鍵還原 —— 退回安裝「新手友善包」之前的原本設定。
#
# 做的事：
#   1. 把設定檔還原成安裝前備份的那一份
#   2. 移除我們放進去的兩支小程式（白話狀態列、資料夾安全鎖）
#
# 用法： bash uninstall.sh
# ─────────────────────────────────────────────────────────────
set -euo pipefail

CLAUDE_DIR="$HOME/.claude"
SETTINGS="$CLAUDE_DIR/settings.json"
MARKER="$CLAUDE_DIR/.newbie-kit"

if [ ! -f "$MARKER" ]; then
  echo "⚠️  找不到安裝紀錄，可能沒裝過、或已經還原過了。沒有任何變更。"
  exit 0
fi

BACKUP_FILE="$(cat "$MARKER")"

echo "↩️  步驟 1／3：還原原本的設定…"
if [ -f "$BACKUP_FILE" ]; then
  if [ "$(cat "$BACKUP_FILE")" = "(none)" ]; then
    rm -f "$SETTINGS"
    echo "   你原本沒有設定檔，已清空回到最初狀態。"
  else
    cp "$BACKUP_FILE" "$SETTINGS"
    echo "   已還原成安裝前的設定。"
  fi
else
  echo "⚠️  備份檔不見了（$BACKUP_FILE），略過設定還原。"
fi

echo "🧹 步驟 2／3：移除放進去的兩支小程式…"
rm -f "$CLAUDE_DIR/statusline-plain.sh"
rm -f "$CLAUDE_DIR/hooks/folder-guard.sh"

echo "📝 步驟 3／3：清掉安裝紀錄…"
rm -f "$MARKER"

echo ""
echo "✅ 已退回原本設定。請「重開一次 Claude Code」讓變更生效。"
