<p align="center">
  <img src="assets/cover.svg" alt="Claude for Everyone" width="100%">
</p>

<h1 align="center">Claude for Everyone・給每一個人的 Claude Code</h1>

<p align="center">
  <b>給「完全沒有寫程式基礎」的人用的 Claude Code 設定包。</b><br>
  <i>A beginner-friendly Claude Code setup for people with zero coding background.</i>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/license-MIT-green" alt="MIT License">
  <img src="https://img.shields.io/badge/for-%E9%9D%9E%E5%B7%A5%E7%A8%8B%E5%B8%AB-blue" alt="for non-engineers">
  <img src="https://img.shields.io/badge/lang-%E7%B9%81%E9%AB%94%E4%B8%AD%E6%96%87-brightgreen" alt="Traditional Chinese">
  <img src="https://img.shields.io/badge/platform-macOS-lightgrey" alt="macOS">
  <img src="https://img.shields.io/badge/PRs-welcome-orange" alt="PRs welcome">
</p>

<p align="center">
  <b>不用會寫程式 · AI 講人話 · 怕弄壞一鍵還原 · 會自己長大</b><br>
  <i>No coding needed · plain-language AI · one-click revert · grows with you</i>
</p>

> 📖 本文件採「**一段中文、一段英文**」對照。
> This README is **bilingual** — each Chinese paragraph is followed by its English version.

---

## 目錄 / Table of Contents

- [這是什麼 / What is this](#what)
- [這跟別的設定包差在哪 / Why this is different](#why)
- [六大功能 / Features](#features)
- [裝起來長這樣 / What it looks like](#preview)
- [快速開始 / Quick start](#quickstart)
- [怎麼用：指令與設定面板 / Usage: commands & control panel](#usage)
- [怕弄壞？一鍵還原 / One-click revert](#revert)
- [常見問題 / FAQ](#faq)
- [這個專案的由來 / The story](#story)
- [一起讓它更好 / Contributing](#contributing)
- [授權 / License](#license)

---

<a id="what"></a>

## 🤔 這是什麼 / What is this

Claude Code 本來是設計給工程師的，預設畫面充滿術語、按鍵、英文縮寫，新手打開常常一臉茫然、不敢亂動。這個包把它「重新裝潢」成**新手模式**——就像把一台有上百個按鈕的專業相機，調成「傻瓜模式」：你只要按下快門，它就幫你把其他都處理好。
Claude Code was built for engineers, so its default screen is full of jargon, shortcuts and abbreviations that leave beginners frozen. This kit "redecorates" it into a **beginner mode** — like switching a professional camera with a hundred buttons into "point-and-shoot": you press the shutter, it handles the rest.

**適合誰？** 你會用電腦、會打字、想用 AI 幫你處理日常工作（整理資料、寫東西、查資料、跑流程），但**完全沒有寫過程式**，看到一堆程式碼就頭痛——這個包就是為你做的。
**Who is it for?** You can use a computer and type, you want AI to help with everyday work (organizing files, writing, research, running tasks), but you've **never written code** and a wall of code makes your head hurt — this kit is made for you.

<a id="why"></a>

## 💡 這跟別的設定包差在哪 / Why this is different

GitHub 上已經有很多 Claude Code 的設定包，但**它們幾乎都假設「你會寫程式」**，賣的是效率、外掛、進階技巧，文件也全是術語。
There are already many Claude Code setup kits on GitHub, but **almost all of them assume you can code** — they sell efficiency, plugins and advanced tricks, and their docs are full of jargon.

**這個包假設你完全不會。** 它的重點不是「更快」，而是「**更安心、更看得懂、不怕弄壞**」——而且它會**一邊用一邊觀察你的習慣，主動幫你把重複的事變成自動的**。這一點，是市面上的包目前沒有的。
**This kit assumes you can't code at all.** Its focus isn't "faster" but "**safer, more understandable, harder to break**" — and it **watches how you work and proactively turns your repeated actions into automation**. That last part is something other kits don't offer yet.

<a id="features"></a>

## ✨ 六大功能 / Features

### 1. 🗣️ 講人話 / Plain language
每次 AI 動手前，會先用一句白話告訴你「我正要做什麼」，全程白話＋生活化比喻，不丟一堆程式碼給你。
Before each action, the AI tells you in one plain sentence what it's about to do, and explains everything in everyday language — no walls of code.
> 🍔 **舉例 / Example：** 你說「幫我把這 50 個檔案改名」，它不會貼一串指令，而是說：「我正在背景幫你改名，改好會告訴你 ✅」。
> Instead of pasting commands, it says: *"I'm renaming them in the background, I'll let you know when it's done ✅."*

### 2. 🔔 語音提醒 / Voice reminders
工作做完、或需要你做決定時，電腦會**出聲叫你**回來看，不用一直盯著螢幕。
When a task finishes or your decision is needed, your computer **speaks up** to call you back — no need to stare at the screen.
> 🍔 **舉例：** 你去倒杯咖啡，回來前就聽到電腦說「工作告一段落，回來看看吧」。
> You go grab a coffee and hear *"the task is done, come take a look"* before you're even back.

### 3. 🔒 資料夾安全鎖 / Folder safety lock
你指定的重要資料夾，AI **只能讀、不能改不能刪**，避免誤動。預設「不鎖任何東西」，要你指定才生效。
Folders you mark as important become **read-only** to the AI — it can look but cannot modify or delete them. Off by default; only protects what you tell it to.
> 🍔 **舉例：** 把「公司財務資料夾」設成唯讀，之後 AI 再怎麼忙，也絕不會手滑改到那裡面的檔案。
> Mark your "company finance folder" as read-only, and no matter how busy the AI gets, it can never slip and edit those files.

### 4. 📊 白話狀態列 / Plain-language status bar
畫面最下方那行，從術語換成人話：現在用哪個助理、在處理哪個資料夾、對話空間用了多少、用量即時數字。
The bottom bar is rewritten from jargon into plain words: which assistant is active, which folder you're in, how much conversation space is used, and live usage numbers.

### 5. 🌱 會自己長大 / Grows with you
這是這個包的**靈魂功能**。AI 一邊跟你互動一邊留意你的習慣——你重複糾正的地方、每次都要的偏好——然後**主動問你**「要不要把它變成自動的」，你點頭它才設定。你也可以隨時打 `/習慣盤點` 叫它幫你盤點。
The **soul** of this kit. As you work, the AI notices your habits — what you keep correcting, the preferences you always ask for — then **proactively asks** "want me to make this automatic?" It only sets it up if you say yes. You can also run `/習慣盤點` anytime to review.
> 🍔 **舉例：** 你連兩次提醒它「報告要附日期」，它就會問：「要不要我以後自動幫你加上日期？」你說好，下次起就自動了。
> After you remind it twice to "add the date to reports," it asks: *"Want me to add the date automatically from now on?"* — say yes, and it just happens.

### 6. 🔍 出廠檢查 / Factory check
只要 AI 改了任何程式 / 設定，做完會**自動做一次輕量品管**：會不會出錯、安不安全，還有「**卡榫檢查**」——剛改的東西跟原本的其他部分**還接不接得上**。有問題先用白話跟你說，**要不要修先問你**。
Whenever the AI changes any code/config, it runs a **lightweight quality check**: any bugs, any safety risks, plus a "**fit check**" — does the change still connect properly with everything else? It flags issues in plain language and **asks before fixing**.

<a id="preview"></a>

## 👀 裝起來長這樣 / What it looks like

裝好後，畫面最下方的**白話狀態列**會像這樣（純文字示意）：
After install, the **plain-language status bar** at the bottom looks like this (text preview):

```
🧠 助理大腦：Opus（最聰明）  ·  📁 正在處理：我的專案  ·  💭 對話空間：用了 12%（充裕）
  ·  🔄 距離自動整理：還剩 88%（很充裕）  ·  ⏳ 這5小時用量：41%（還很夠）  ·  📅 這7天用量：68%（用得差不多了）
```

每一段都是白話，不用懂術語也看得懂；用量是**即時數字**，每 10 秒更新。
Every part is plain language — no jargon needed — and the usage figures are **live**, refreshed every 10 seconds.

> 💬 歡迎大家裝完後幫忙補幾張真實截圖，一起讓新手更有畫面感（見 [一起讓它更好](#contributing)）。
> Contributions of real screenshots are very welcome — see [Contributing](#contributing).

<a id="quickstart"></a>

## 🚀 快速開始 / Quick start

### 你需要先有什麼 / Prerequisites
- 一台 **Mac**（語音提醒用的是 Mac 內建功能；Windows/Linux 也能用，語音那條請 Claude 幫你改）。
  A **Mac** is ideal (voice uses a built-in Mac feature; Windows/Linux work too — ask Claude to adapt the voice line).
- 已安裝 **Claude Code**，以及兩個小工具 **jq**、**python3**（多數 Mac 已內建；缺的話直接請 Claude 幫你裝）。
  **Claude Code** installed, plus two small tools **jq** and **python3** (usually preinstalled on Mac; if missing, just ask Claude to install them).

### 最簡單的裝法（推薦）/ The easy way (recommended)
把這個資料夾下載到電腦，打開 Claude Code，直接對它說：
Download this folder, open Claude Code, and just say:

> **「請照這個資料夾裡的說明，把我的 Claude Code 設定成新手友善模式。」**
> *"Please follow the instructions in this folder and set up my Claude Code in beginner-friendly mode."*

它會一步步用白話帶你完成，需要你決定的地方會白話問你。
It walks you through everything in plain language and asks you whenever a decision is needed.

### 自己動手裝 / Install it yourself
在這個資料夾執行一鍵安裝（**安裝前會自動備份你原本的設定**）：
Run the one-click installer inside this folder (**it backs up your existing settings first**):

```bash
bash install.sh
```

裝完**重開一次 Claude Code** 就生效。
Restart Claude Code once and you're done.

<a id="usage"></a>

## 🎛️ 怎麼用：指令與設定面板 / Usage: commands & control panel

裝好後，你可以用這些**白話指令**（在 Claude Code 輸入框打 `/` 開頭）：
After install, you can use these **plain-language commands** (type `/` in the Claude Code input):

| 指令 / Command | 做什麼 / What it does |
| --- | --- |
| `/說明` | 列出你有哪些功能、哪些指令可以用（help）。<br>List all features and commands (help). |
| `/設定面板` | **逐條開關**每個功能，用講的就能操作（像 config 面板）。<br>Turn each feature on/off by talking (like a config panel). |
| `/習慣盤點` | 找出可以幫你自動化的習慣，一項一項問你要不要做。<br>Find habits worth automating and ask you one by one. |
| `/出廠檢查` | 對剛改的東西做一次輕量檢查（多面審查＋卡榫接合）。<br>Run a lightweight check on recent changes. |

想開關某個功能，最直覺的方式就是打 `/設定面板`，然後**用白話告訴它**，例如：
The most intuitive way to toggle a feature is `/設定面板`, then **just say it in plain words**, e.g.:

> 「把語音提醒關掉」/ *"Turn off the voice reminders"*
> 「幫我保護『我的財務』這個資料夾」/ *"Protect my 'Finance' folder"*
> 「音量太大，調小一點」/ *"Too loud, turn the volume down"*

<a id="revert"></a>

## ↩️ 怕弄壞？一鍵還原 / One-click revert

安裝會先自動「拍照備份」你原本的設定。不喜歡的話，跟 Claude 說「**退回原本設定**」，或自己執行還原指令，就能**完整回到安裝前**的樣子（連你原本的 model、主題、自己的設定都保留）。
Installation first takes a full snapshot of your original settings. If you don't like it, tell Claude *"revert to my original settings"*, or run the command below — everything goes back **exactly as before** (your original model, theme and custom settings are all preserved).

```bash
bash uninstall.sh
```

<a id="faq"></a>

## ❓ 常見問題 / FAQ

完整 FAQ 看 👉 [docs/05-常見問題.md](docs/05-常見問題.md)。這裡放最多人問的兩題：
Full FAQ 👉 [docs/05-常見問題.md](docs/05-常見問題.md). Two most-asked here:

**Q：畫面上那些技術框框能完全關掉嗎？**
老實說目前官方還做不到完全隱藏，但這個包已經幫你「每次動作前加一句白話翻譯」，所以那些框框你**可以完全不用看**。
**Q: Can I fully hide those technical boxes?** Not yet (the official tool doesn't support it), but this kit adds a plain-language sentence before every action, so you **can simply ignore** those boxes.

**Q：會不會把我電腦弄壞？**
不會。安裝前會完整備份，隨時 `bash uninstall.sh` 一鍵還原；安全鎖也只保護、不破壞。
**Q: Could it break my computer?** No. It backs everything up first, reverts with one command, and the safety lock only protects — it never destroys.

### 📚 更多說明 / More docs
全程白話、零基礎也看得懂（目前為繁體中文）。Plain-language guides for absolute beginners (Traditional Chinese).

- [01・開始使用](docs/01-開始使用.md)
- [02・六大功能怎麼運作](docs/02-五個小幫手.md)
- [03・白話狀態列](docs/03-白話狀態列.md)
- [04・資料夾安全鎖](docs/04-資料夾安全鎖.md)
- [05・常見問題](docs/05-常見問題.md)

<a id="story"></a>

## 📖 這個專案的由來 / The story

這些設定不是憑空設計的，而是我**自己用 Claude Code CLI 大約六個月**，一路累積下來的使用習慣與心得。我自己也不是工程師，踩過很多「看不懂、怕弄壞、重複做白工」的坑，於是慢慢把這些痛點變成一個個小機關，最後整理成這個包，希望讓後面的新手少走一些冤枉路。
These settings weren't designed in a vacuum — they come from **about six months of using the Claude Code CLI myself**, gradually shaping my own habits and lessons. I'm not an engineer either; I hit plenty of "I don't understand / I'm afraid I'll break it / I keep redoing the same thing" pitfalls, and slowly turned each pain point into a little helper. This kit is the result, meant to save the next beginner some of that trouble.

<a id="contributing"></a>

## 🤝 一起讓它更好 / Contributing

**非常歡迎大家提供想法，一起迭代，讓新手用得更順手。** 你不需要會寫程式也能幫忙：
**Ideas are very welcome — let's iterate together and make this smoother for beginners.** You don't need to code to help:

- 💬 有想法、覺得哪裡不好懂 → 開一個 [Issue](../../issues) 用白話講就好。
  Have an idea or found something confusing → open an [Issue](../../issues), plain words are fine.
- 📸 裝完願意分享一張截圖 / 一個使用小撇步 → 超級歡迎。
  Willing to share a screenshot or a tip after installing → hugely appreciated.
- 🛠️ 會一點技術、想修 bug 或加功能 → 歡迎發 Pull Request。
  Comfortable with some tech and want to fix/add things → Pull Requests welcome.

<a id="license"></a>

## 📄 授權 / License

MIT —— 隨你自由使用、修改、分享。
MIT — free to use, modify, and share.
