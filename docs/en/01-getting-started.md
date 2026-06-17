# 01 · Getting Started

> 🌐 [中文](../01-開始使用.md) · **English**

## What you need first

1. **A computer** — a Mac is ideal (the voice reminders use a built-in Mac feature). Windows / Linux work too; just ask Claude to adapt the voice line.
2. **Claude Code installed** — if you haven't, follow the instructions on the Claude Code website.
3. **Two small tools, `jq` and `python3`** — most Macs already have them. If something's missing, just tell Claude "install jq for me." (Without jq, the one-click installer pauses automatically and won't touch your settings.)
4. That's it — no coding required.

## The easy way (recommended)

Download this folder, open Claude Code, and just say:

> **"Please follow the instructions in this folder and set up my Claude Code in beginner-friendly mode."**

Claude will put the settings in the right place, ask whether you want to protect any folder, and confirm everything works. **You only need to answer its plain-language questions.**

> Prefer to do it yourself? Run `bash install.sh` inside this folder. **It backs up your existing settings first**, and you can revert anytime with `bash uninstall.sh`.

## Where does it put things?

Claude Code keeps all its settings in a folder called `.claude` on your computer (usually in your home directory). This kit adds:

- The main settings file (plain-language replies, voice, the safety lock, the status bar)
- A "folder safety lock" script and a "plain-language status bar" script
- Four plain-language commands (`/說明`, `/設定面板`, `/習慣盤點`, `/出廠檢查`)
- Plain-language memory plus the standing instructions for "Grows with you / Factory check"

## After installing

- **Restart Claude Code once** for the new settings to take effect.
- Then use it as usual. Whenever a decision is needed, it speaks up and asks you in plain words.

## How do I know it worked?

After restarting, try these three quick checks (any one responding means success):

1. **Look at the bottom line of the screen** — do you see icons like 🧠 📁 💭? Yes → the status bar works.
2. **Type `/說明`** — does a list of features and commands pop up? Yes → commands work.
3. **Ask it to do a small task** — when it's done, did you hear the computer speak? Yes → voice reminders work.

> If nothing responds, just tell Claude "**the status bar didn't take effect, please check it**" and it will look into it.

## Want to customize?

- Protect a folder → see [04 · Folder Safety Lock](04-folder-lock.md)
- Change what the status bar shows → see [03 · The Plain Status Bar](03-status-bar.md)
- Confused by something → just ask Claude; it explains in plain words.
