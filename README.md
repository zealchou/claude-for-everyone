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
  <b>⭐ 會自己長大 · AI 講人話 · 怕弄壞一鍵還原 · 不用會寫程式</b><br>
  <i>⭐ grows with you · plain-language AI · one-click revert · no coding needed</i>
</p>

> 📖 本文件採「**一段中文、一段英文**」對照。
> This README is **bilingual** — each Chinese paragraph is followed by its English version.

> 🚧 **工程師請止步（認真的）。** 這裡沒有 MCP、沒有 sub-agent 編排、沒有 prompt 工程技巧，也不會讓你的 CI 變快。如果你看得懂這句話，這個包大概不是為你做的——它是為你「那位完全不會寫程式、但很想用 AI 的家人 / 同事 / 老闆」做的。把連結傳給他們，你就可以回去寫你的 code 了。😎
> 🚧 **Engineers, look away (seriously).** No MCP, no sub-agent orchestration, no prompt-engineering tricks, and it won't speed up your CI. If you understood that sentence, this kit probably isn't for you — it's for that family member / colleague / boss of yours who can't code but really wants to use AI. Send them the link and get back to your own code. 😎

> ⭐ **這個包最特別的一招：它會「自己長大」。** 別的設定包下載完就定型了；這個包會**一邊陪你工作、一邊偷偷觀察你的習慣**，然後主動問你：「這件事你好像每次都要做，要不要我幫你變成自動的？」你越用，它越懂你、幫你省越多事。這是它跟市面上所有設定包最不一樣的地方 👉 [🌱 看看它怎麼長大](#features)。
> ⭐ **The kit's signature move: it _grows with you_.** Other kits are frozen the moment you download them; this one **works alongside you and quietly learns your habits**, then asks: "You seem to do this every time — want me to automate it?" The more you use it, the better it fits you. 👉 [See how it grows](#features).

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

老實說，Claude Code 是工程師做給工程師用的——預設畫面塞滿術語、英文縮寫、看不懂的框框，新手一打開常常是「這⋯⋯我可以碰嗎？會不會按一下就爆炸？」於是看了三分鐘就關掉了。這個包把它**整個重新裝潢**成新手模式：就像把一台有上百顆按鈕的專業相機，切到「傻瓜模式」——你只要按快門，剩下的它全包。
Honestly, Claude Code is made by engineers, for engineers — the default screen is packed with jargon and cryptic boxes that make a beginner go "…am I allowed to touch this? Will it explode if I click?" This kit **completely redecorates** it into beginner mode: like flipping a pro camera with a hundred buttons into "point-and-shoot" — you press the shutter, it handles the rest.

**適合誰？** 你會用電腦、會打字、想用 AI 幫你處理日常工作（整理資料、寫東西、查資料、跑流程），但**這輩子沒寫過一行程式**，看到程式碼就想闔上電腦——對，就是你，這個包就是為你做的。
**Who is it for?** You can use a computer and type, you want AI for everyday work (organizing files, writing, research, running tasks), but you've **never written a line of code** and a wall of code makes you want to shut the laptop — yes, you; this kit is for you.

<a id="why"></a>

## 💡 這跟別的設定包差在哪 / Why this is different

GitHub 上 Claude Code 的設定包多如牛毛，但**它們幾乎都偷偷假設「你會寫程式」**：賣的是效率、外掛、進階技巧，文件打開全是術語，新手看了只會更慌。
GitHub is full of Claude Code setup kits, but **almost all of them quietly assume you can code** — selling speed, plugins and advanced tricks, with docs that only make a beginner more anxious.

**這個包反過來，假設你完全不會、而且會怕。** 所以它的重點不是「更快」，而是「**更安心、更看得懂、不怕弄壞**」。但真正讓它與眾不同的，是那個 ⭐ **「會自己長大」**——它不是一套死的設定，而是會**持續觀察你、主動幫你把重複勞動變成自動化**（你點頭才做）。換句話說：別的包是「工具」，這個包比較像一個**會越來越懂你的助理**。這一點，目前市面上面向新手的包幾乎找不到。
**This kit flips it: it assumes you can't code — and that you're nervous about it.** So its focus isn't "faster" but "**safer, clearer, harder to break**." But what truly sets it apart is ⭐ **"Grows with you"** — it's not a frozen config, it **keeps watching how you work and proactively turns repetitive labor into automation** (only with your yes). In other words: other kits are *tools*; this one is more like **an assistant that understands you better over time** — something beginner-focused kits simply don't offer yet.

<a id="features"></a>

## ✨ 六大功能 / Features

> 下面每個功能都說明「它解決什麼痛點」「跟一般設定包差在哪」「實際舉例」，讓你不用安裝也想像得到。
> Each feature explains the pain it solves, how it differs from typical kits, and a concrete example.

### 1. 🗣️ 講人話 / Plain language

新手用 Claude Code 最大的挫折，是**畫面一直跳出看不懂的東西**：一串指令、一塊程式碼、一堆英文縮寫，明明只是想請它幫個忙，卻好像在看工程師的工作日誌。久了就會「不敢按、不敢試」，因為根本不知道它在做什麼、會不會出事。

這個功能把互動方式整個翻過來：**AI 每次動手之前，會先用一句白話告訴你「我正要做什麼」**，過程中也一律用生活化的比喻說明，複雜的步驟丟到背景去跑，前台只給你「結果」而不是「過程」。它靠的是一個每次都會自動觸發的提醒機制，不是靠 AI「臨時記得」要講人話——所以很穩定，不會今天客氣、明天又滿嘴術語。

**跟別的 repo 差在哪：** 市面上的設定包大多假設「你看得懂程式」，賣的是讓工程師更快；它們不在乎畫面對新手友不友善。這個包反過來，把「讓你看得懂、敢放心用」放在第一位。
> 🍔 **舉例：** 你說「幫我把這 50 個檔案改名」，它不會貼一長串指令，而是說：「我正在背景幫你改名，改好會跟你說 ✅」。你看那句話就好，那些技術框框當背景雜訊忽略它即可。

*English:* The biggest frustration for beginners is the constant stream of incomprehensible output. This kit flips it: the AI says one plain sentence before each action, uses everyday analogies, and runs heavy steps in the background — reporting results, not raw process. Unlike typical kits that assume you can read code, this one puts "you understand it and feel safe" first.

### 2. 🔔 語音提醒 / Voice reminders

用 AI 處理事情，常常會有「空檔」——它在背景跑一個比較久的任務，你不知道好了沒，只能一直回來盯著螢幕看，很浪費時間，也很焦慮。更糟的是，有時候它**卡在一個需要你做決定的地方**，你卻沒注意到，結果它就一直等、你也一直等。

這個功能讓電腦在兩個關鍵時刻**主動出聲叫你**：一是「工作告一段落」，二是「需要你做決定」。聲音用的是 Mac 內建的語音，預設音量 40%（辦公室不會太吵），覺得吵或不想要，跟它說一聲就能調小或關掉。這樣你就能放心去做別的事，該回來的時候它會喊你。

**跟別的 repo 差在哪：** 大部分設定包頂多做個桌面通知小視窗，預設你會一直坐在電腦前盯著。這個包預設你是「忙碌、會離開座位」的一般使用者，所以用更難被忽略的「聲音」提醒。
> 🍔 **舉例：** 你交代一件事後跑去倒咖啡，還沒走回座位，就聽到電腦說「工作告一段落，回來看看吧」——不用每隔三十秒回來看一次。

*English:* AI tasks often leave you waiting, refreshing the screen, or missing the moment it needs your decision. This feature makes your computer speak up at two key moments — "task done" and "your decision needed" — using the built-in Mac voice at 40% volume (adjustable or off on request). Most kits only show a desktop popup assuming you're glued to the screen; this one assumes you're a busy person who steps away.

### 3. 🔒 資料夾安全鎖 / Folder safety lock

把重要資料交給 AI 處理，心裡多少會有個疙瘩：「萬一它手滑，把我的重要檔案改壞或刪掉怎麼辦？」對非工程師來說，這種「不可逆的意外」特別可怕，因為你可能根本不知道怎麼救回來。

這個功能就是那道保險：你指定某個資料夾為「保護區」，AI 之後**只能讀、不能改、不能刪、不能搬**裡面的東西。它讀資料、查資料完全沒問題，但只要偵測到「修改 / 刪除 / 覆蓋 / 搬移」的動作指向保護區，就會**當場攔下來**，並用白話告訴你為什麼被擋。你也可以在保護區裡留一個「暫存抽屜」，讓它有地方放東西。預設是「不鎖任何資料夾」，要你指定才生效，所以不會莫名其妙擋到你。

**跟別的 repo 差在哪：** 工程師取向的包通常假設你會自己用 git、會自己備份、出事會自己救；它們很少內建「防呆護欄」。這個包假設你不會這些，所以把「防止不可逆的意外」直接做成內建功能。
> 🍔 **舉例：** 把「公司財務」資料夾設成唯讀，之後 AI 再怎麼忙、再怎麼自動化，也絕對不會手滑改到那裡面任何一個檔案——你可以放心讓它幫你查、幫你整理，但動不了正本。

*English:* Handing important files to an AI is nerve-wracking — what if it slips and ruins something irreversible? This lock lets you mark a folder as read-only: the AI can read freely but any modify/delete/move targeting it is blocked on the spot, with a plain explanation. You can leave one writable "drawer" inside. Off by default. Engineer-focused kits assume you can git/backup/recover yourself; this one builds the guardrail in.

### 4. 📊 白話狀態列 / Plain-language status bar

Claude Code 畫面最下方那一行（狀態列），預設塞滿術語：model 名稱、context %、token 數、cost……對工程師是儀表板，對新手是天書。你最想知道的其實很單純：「現在這個 AI 聰不聰明？」「我的額度還夠不夠？」「對話是不是快滿了？」

這個功能把那行**整個翻成白話**，只留你真正在乎的資訊：🧠 現在用哪個助理大腦（Opus 最聰明／Sonnet 又快又好／Haiku 最快）、📁 正在處理哪個資料夾、💭 這次對話的記憶空間用了多少、🔄 距離「自動整理」還剩多少（這個數字會越用越少，逼近 0 時 AI 會自動把前面對話濃縮、騰出空間）、⏳📅 你訂閱方案的 5 小時與 7 天**即時用量數字**。每 10 秒自動更新，而且每一項都配一句白話形容（充裕／用得差不多了／快用完）。

**跟別的 repo 差在哪：** 也有不少包提供漂亮的狀態列，但幾乎都是給工程師看的（進度條、git 分支、花費美金）。這個包是目前少數把它**徹底白話化**、還貼心加上「快用完會自動恢復」這種安心提示的。
> 🍔 **舉例：** 你看到「📅 這7天用量：68%（用得差不多了）」，就知道這週還能用、但要省著點，不用去猜那些百分比到底代表什麼。

*English:* The default status bar is a jargon dashboard (model, context %, tokens, cost). This rewrites it into plain words showing only what you care about: which brain is active, which folder, how much conversation memory is used, how far until auto-compaction (a number that counts down), and your live 5-hour / 7-day usage — refreshed every 10 seconds, each with a plain descriptor. Few kits make the bar this beginner-friendly.

### 5. 🌱 會自己長大 / Grows with you　**← 靈魂功能 / the soul**

這是這個包**最特別、別人沒有的東西**。一般的「記憶」只是把事情記下來；這個功能更進一步——它會**一邊陪你工作、一邊觀察你的習慣**，然後主動幫你把重複的事變成「自動的」。

它留意四種訊號：你**重複糾正**同一件事、**每次都要求**同一種做法、**老是手動重做**同一個流程、甚至**定時／週期性**要做某件事。一旦發現規律，它就**主動用白話問你**：「我發現你常常⋯⋯要不要我幫你把它變成自動的？」你說「好」它才動手；你說「不用」它就記住、不再囉嗦。而且它會依情況挑最適合的形式：簡單規則做成 **hook**（每次自動執行）、常用動作做成**指令**（你喊一聲就能用）、定時的事做成 **loop／排程**、一長串多步驟流程做成**工作流（harness／workflow）**，甚至多個分身協作完成。

換句話說，它把「記住你的偏好」升級成「**幫你設計自動化的運作機制**」——你用得越久，它就越貼合你、幫你省掉越多重複勞動。你也可以隨時打 `/習慣盤點`，叫它主動幫你盤點一次「有哪些事可以變自動」。

**跟別的 repo 差在哪：** 其他設定包是「靜態」的——你下載什麼就是什麼，要進步得自己去改。這個包是**會成長的**：它把「持續觀察 + 主動提議自動化（你同意才做）」變成內建習慣。這個「自己長大」的迴圈，目前在面向新手的設定包裡幾乎看不到。
> 🍔 **舉例：** 你連兩次提醒它「報告開頭要放日期」，它就會問：「要不要我以後自動幫你加上日期？」你說好，下次起就自動了；又或者它發現你每週一都在整理同一份資料，會問你「要不要設成每週一自動幫你跑？」

*English:* The kit's **soul**, and what others lack. Plain memory just stores facts; this **watches how you work and turns repetition into automation**. It notices four signals — repeated corrections, always-requested preferences, manually-repeated workflows, and periodic tasks — then proactively asks whether to automate, only acting on a yes. It picks the right form: a **hook** (auto every time), a **command**, a **loop/schedule**, or a multi-step **workflow/harness**. So it upgrades "remembering preferences" into "designing automation for you," fitting you more the longer you use it. Run `/習慣盤點` to trigger a review. Other kits are static; this one grows.

### 6. 🔍 出廠檢查 / Factory check

當你請 AI 幫你改一個設定、寫一段小程式、調整一個流程，你心裡其實沒底：「它改的對不對？會不會把別的地方弄壞？」非工程師沒辦法自己看程式碼檢查，只能祈禱它沒出錯——這正是最不安的地方。

這個功能就是幫你「驗收」：只要 AI 改動了任何程式或設定，做完會**自動做一次輕量品管**，從三個角度看：**會不會出錯**（明顯的 bug、文法錯誤）、**安不安全**（有沒有風險、會不會誤刪），還有一個特別的**「卡榫檢查」**——就像組鋼彈模型要確認每個零件的卡榫都接得上，它會檢查「剛改的這個零件，跟原本會用到它的其他部分**還接不接得上**」，而不是只看單一檔案。重要或複雜的改動，它還會派 1～2 個獨立檢查員從不同角度交叉確認。檢查完用一兩句白話告訴你結果，**要不要修先問你**。你也可以隨時打 `/出廠檢查`。

**跟別的 repo 差在哪：** 程式碼審查工具一大堆，但都是給工程師、用術語報告的。這個包把「改完自動檢查」變成**新手也能安心依賴的內建習慣**，而且報告全是白話。
> 🍔 **舉例：** 它幫你改完一個自動化規則後說：「我檢查過了，規則本身沒問題，但有個地方建議加個保護，要不要我順手補上？」——你不用看任何程式碼，就知道安不安全。

*English:* When the AI changes a setting or writes code, you can't tell if it's right or if it broke something else. This auto-runs a lightweight check after every change from three angles — correctness, safety, and a special **"fit check"** (like checking model-kit joints snap together): does the changed part still connect with everything that uses it, not just the file in isolation. Important changes get 1–2 independent reviewers. Results come in plain language, and it **asks before fixing**. Run `/出廠檢查` anytime. Unlike engineer-facing review tools, this is a beginner-safe built-in habit reported in plain words.

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
全程白話、零基礎也看得懂。中英文版都有。Plain-language guides for absolute beginners, in both Chinese and English.

| 繁體中文 | English |
| --- | --- |
| [01・開始使用](docs/01-開始使用.md) | [01 · Getting Started](docs/en/01-getting-started.md) |
| [02・六大功能怎麼運作](docs/02-六大功能.md) | [02 · How the Six Features Work](docs/en/02-features.md) |
| [03・白話狀態列](docs/03-白話狀態列.md) | [03 · The Plain Status Bar](docs/en/03-status-bar.md) |
| [04・資料夾安全鎖](docs/04-資料夾安全鎖.md) | [04 · The Folder Safety Lock](docs/en/04-folder-lock.md) |
| [05・常見問題](docs/05-常見問題.md) | [05 · FAQ](docs/en/05-faq.md) |

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
