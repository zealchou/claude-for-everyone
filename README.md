<p align="center">
  <img src="assets/cover.svg" alt="Claude for Everyone" width="100%">
</p>

<h1 align="center">Claude for Everyone・給每一個人的 Claude Code</h1>

<p align="center">
  <b>給完全沒有寫程式基礎的人用的 Claude Code 設定包</b><br>
  <i>A beginner-friendly Claude Code setup for people with zero coding background</i>
</p>

---

> 本文件採「**一段中文、一段英文**」對照。
> This README is **bilingual** — each Chinese paragraph is followed by its English version.

## 這是什麼？ / What is this?

Claude Code 本來是設計給工程師的，預設畫面充滿術語。這個包把它「重新裝潢」成新手模式——就像把一台專業相機調成傻瓜模式，你不用懂任何技術，也能安心使用。

Claude Code was built for engineers, so its default interface is full of jargon. This kit "redecorates" it into a beginner mode — like switching a professional camera into point-and-shoot. You can use it comfortably without understanding any of the tech.

## 它幫你做了什麼？ / What does it do for you?

🗣️ **講人話 / Plain language** — 每次動手前先用一句白話說明，全程白話＋比喻，不丟一堆程式碼給你。
Before each action it tells you in one plain sentence what it's about to do, and explains everything in everyday language with analogies — no walls of code.

🔔 **語音提醒 / Voice reminders** — 工作做完、或需要你決定時，電腦會出聲叫你回來看，不用一直盯著螢幕。
When a task finishes or your decision is needed, your computer speaks up to call you back — no need to stare at the screen.

🔒 **資料夾安全鎖 / Folder safety lock** — 你指定的重要資料夾，AI 只能讀、不能改不能刪，避免誤動。
Folders you mark as important become read-only to the AI — it can look, but cannot modify or delete them.

🧠 **記憶 / Memory** — 把「你是誰、你的習慣」長期記住，不用每次重講。
It remembers who you are and how you like to work, so you never have to repeat yourself.

📊 **白話狀態列 / Plain-language status bar** — 畫面最下方那行，從術語換成人話：現在用哪個助理、在處理哪個資料夾、對話空間還剩多少、用量即時數字。
The bottom bar is rewritten from jargon into plain words: which assistant is active, which folder you're in, how much conversation space is left, and live usage numbers.

## 怎麼用？（最簡單的方法） / How to use it (the easy way)

你**不需要自己動手裝**。把這個資料夾下載到電腦後，打開 Claude Code，直接對它說：「**請照這個資料夾裡的說明，把我的 Claude Code 設定成新手友善模式。**」它會一步步用白話帶你完成。
You **don't have to install anything yourself**. Download this folder, open Claude Code, and just say: *"Please follow the instructions in this folder and set up my Claude Code in beginner-friendly mode."* It will walk you through everything in plain language.

想自己動手的話，下載後在這個資料夾執行一鍵安裝即可（安裝前會自動備份你原本的設定）。
If you prefer to do it yourself, just run the one-click installer inside this folder (it automatically backs up your existing settings first):

```bash
bash install.sh
```

## 怕弄壞？一鍵還原 / Worried? One-click revert

安裝會先自動「拍照備份」你原本的設定。不喜歡的話，跟 Claude 說「**退回原本設定**」，或自己執行還原指令，就能完整回到安裝前的樣子。
Installation first takes a full snapshot of your original settings. If you don't like it, tell Claude *"revert to my original settings"*, or run the revert command yourself — everything goes back exactly as it was.

```bash
bash uninstall.sh
```

## 這個資料夾裡有什麼？ / What's inside?

```
install.sh / uninstall.sh   一鍵安裝 / 一鍵還原  ·  one-click install / revert
settings.example.json       主設定（白話提醒、語音、安全鎖、狀態列）
hooks/folder-guard.sh       資料夾安全鎖  ·  folder safety lock
scripts/statusline-plain.sh 白話狀態列  ·  plain-language status bar
scripts/notify-telegram.sh  （選用）把檔案傳到 Telegram  ·  (optional) send files to Telegram
memory/                     記憶範本  ·  memory templates
docs/                       全程白話的說明書  ·  plain-language guides
```

## 文件導覽 / Documentation

說明書全程白話，零基礎也看得懂（目前為繁體中文）。
The guides are written in plain language for absolute beginners (currently in Traditional Chinese).

- [01・開始使用 / Getting started](docs/01-開始使用.md)
- [02・五個小幫手 / The five helpers](docs/02-五個小幫手.md)
- [03・白話狀態列 / The plain status bar](docs/03-白話狀態列.md)
- [04・資料夾安全鎖 / The folder lock](docs/04-資料夾安全鎖.md)
- [05・常見問題 / FAQ](docs/05-常見問題.md)

## 授權 / License

MIT —— 隨你自由使用、修改、分享。
MIT — free to use, modify, and share.
