# 03 · The Plain-Language Status Bar

> 🌐 [中文](../03-白話狀態列.md) · **English**

The "status bar" is the **bottom rows** of the Claude Code screen. The default version is full of jargon (model, context %, tokens…) that beginners can't read. This kit rewrites it into plain language — and splits it across **three lines**, because cramming everything onto one line pushes the end off-screen where you can't see it.

## What it looks like after the switch (three lines)

```
🧠 Brain: Opus (smartest)   ·   📁 Working on: my-project
💭 Conversation space: 12% used (plenty)   ·   🔄 Until auto-tidy: 88% left (plenty)
⏳ Last 5 hours: 41% used (still fine)   ·   📅 Last 7 days: 68% used (getting there)
```

Each line covers one thing, readable at a glance:

- **Line 1 · Identity**: which assistant brain is active, and which folder you're in.
- **Line 2 · Conversation**: how much conversation memory is used, and how much room is left before auto-tidy.
- **Line 3 · Quota**: how much of your 5-hour / 7-day quota is used (numbers only on Pro / Max;
  on the free plan this line shows a gentle note instead, so it still stays three clean lines).

What each part means:

| Display | Plain meaning |
| --- | --- |
| 🧠 Brain | Which AI is active. Opus = smartest, Sonnet = fast & good, Haiku = fastest, Fable = newest |
| 📁 Working on | The name of the folder you're currently in |
| 💭 Conversation space | How much of this conversation's "memory" is used (grows as you go) |
| 🔄 Until auto-tidy | How much room is left before "auto-compaction" kicks in. **This number counts down** like a fuel gauge. Near 0%, Claude automatically condenses earlier conversation to free up space |
| ⏳ Last 5 hours | How much of your short-term quota is used (**live number**, shown only on Pro / Max) |
| 📅 Last 7 days | How much of your weekly quota is used (live number, shown only on Pro / Max) |

> If you don't have a subscription plan, the last two (usage) parts simply don't show — no errors.

## How often do the numbers update?

A setting refreshes it **every 10 seconds**, so usage is near real-time. (These usage figures only appear after you've talked to the AI and gotten a first response.)

## Want to change what it shows?

Just tell Claude, for example:
- "Add how much I've spent today to the status bar"
- "I don't want the 7-day usage, remove it"
- "It's too long, trim it down"

Just say it — Claude knows to edit the active copy (at `~/.claude/statusline-plain.sh`). **Restart Claude Code** after changes for them to take effect.
