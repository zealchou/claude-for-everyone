#!/bin/bash
# ─────────────────────────────────────────────────────────────
# 一鍵安裝（會先幫你「拍照備份」原本的設定，之後隨時能還原）
#
# 做的事：
#   1. 把你現在的設定整份備份起來（蓋了也不怕，隨時能退回）
#   2. 把「白話狀態列」「資料夾安全鎖」兩支小程式放進 Claude 設定資料夾
#   3. 把新手友善設定合併進你的設定檔
#   4. 記錄這次備份的位置，給「一鍵還原」用
#
# 用法： bash install.sh
# 還原： bash uninstall.sh
# ─────────────────────────────────────────────────────────────
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_DIR="$HOME/.claude"
BACKUP_DIR="$CLAUDE_DIR/backups"
STAMP="$(date +%Y%m%d-%H%M%S)"
MARKER="$CLAUDE_DIR/.newbie-kit"

mkdir -p "$CLAUDE_DIR/hooks" "$BACKUP_DIR"

echo "📸 步驟 1／4：備份你原本的設定…"
SETTINGS="$CLAUDE_DIR/settings.json"
BACKUP_FILE="$BACKUP_DIR/settings.before-newbie-kit.$STAMP.json"
if [ -f "$SETTINGS" ]; then
  cp "$SETTINGS" "$BACKUP_FILE"
  echo "   已備份到：$BACKUP_FILE"
else
  echo "(none)" > "$BACKUP_FILE"
  echo "   你原本沒有設定檔，已記錄（還原時會直接清空）。"
fi

echo "🧩 步驟 2／4：放入兩支小程式（白話狀態列、資料夾安全鎖）…"
cp "$HERE/scripts/statusline-plain.sh" "$CLAUDE_DIR/statusline-plain.sh"
cp "$HERE/hooks/folder-guard.sh"      "$CLAUDE_DIR/hooks/folder-guard.sh"
chmod +x "$CLAUDE_DIR/statusline-plain.sh" "$CLAUDE_DIR/hooks/folder-guard.sh"

echo "⚙️  步驟 3／4：套用新手友善設定…"
if [ -f "$SETTINGS" ] && command -v jq >/dev/null 2>&1; then
  # 有舊設定 + 有 jq → 合併（保留你原本的 model / 主題等，只覆蓋我們要設的項目）
  jq -s '.[0] * .[1]' "$SETTINGS" "$HERE/settings.example.json" > "$SETTINGS.tmp" \
    && mv "$SETTINGS.tmp" "$SETTINGS"
else
  # 沒舊設定（或沒裝 jq）→ 直接放上新手設定
  cp "$HERE/settings.example.json" "$SETTINGS"
fi

echo "📝 步驟 4／4：記錄備份位置（給一鍵還原用）…"
printf '%s\n' "$BACKUP_FILE" > "$MARKER"

echo ""
echo "✅ 完成！請「重開一次 Claude Code」讓設定生效。"
echo "   不喜歡的話，隨時執行： bash uninstall.sh  即可退回原本設定。"
