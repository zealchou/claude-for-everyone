# 05 · FAQ

> 🌐 [中文](../05-常見問題.md) · **English**

## Q: What is "Grows with you," and how is it different from native memory?

This is the **soul** of the kit. Native memory just "stores facts." "Grows with you" goes further — as the AI works with you, it watches **what you keep correcting, the preferences you always ask for, the workflows you redo by hand, even periodic tasks** — then **proactively asks**: "Want me to make this automatic?"

If you say yes, it sets it up as automation (an auto-running rule, a command you can call, a scheduled routine, or a full multi-step flow). If you say no, it remembers and stops bothering you.

So it's not just "remembering" — it **gradually turns your habits into time-saving automation**, fitting you more the longer you use it. You can also run `/習慣盤點` anytime to trigger a review.

---

## Q: Can I fully hide those technical boxes (code, "Wrote 50 lines"…)?

**Honestly: not yet.** Claude Code currently has no setting to fully hide the progress boxes.

What you can do:

- **Press `Ctrl + O`** to switch display modes and collapse some boxes for a cleaner view. (File operations still show, though.)
- **Treat them as background noise.** This kit is already set up so the AI says one plain sentence before each action. Just read that sentence — like riding in a taxi, you don't need to understand the engine; you just hear the driver say "almost there."

Many users are asking for a "fully hide" switch, but it isn't available officially yet. This doc will be updated when it is.

---

## Q: The voice reminder is too loud / I don't want it. What do I do?

Just tell Claude "turn off the voice reminders" or "lower the volume" and it'll adjust. (Default volume is 40%.)

---

## Q: I use Windows / Linux — will the voice reminders work?

No, that part is Mac-only by default. Tell Claude your system and ask it to switch to an equivalent reminder.

---

## Q: What do the numbers in the status bar mean?

- 🧠 **Brain**: which AI is active (Opus smartest, Sonnet fast & good, Haiku fastest)
- 📁 **Working on**: the folder you're currently in
- 💭 **Conversation space**: how much of this conversation's "memory" is used (grows as you go)
- 🔄 **Until auto-tidy**: how much room is left before "auto-compaction" triggers. **This number counts down**; near 0%, Claude condenses earlier conversation to free space.
- ⏳ **Last 5 hours**: short-term quota used (live number, Pro / Max only)
- 📅 **Last 7 days**: weekly quota used (live number, Pro / Max only)

---

## Q: Will the safety lock get in the way of what I want to do?

It never blocks reading — only "modify / delete / move" on the folder you chose to protect. And by default nothing is protected; it only activates once you specify a folder.

---

## Q: How do I turn a feature on or off? (voice, safety lock, factory check…)

Type `/設定面板`. It lists each feature's current on/off state in plain language, then you just tell it which to turn on/off — e.g. "turn off the voice" or "protect a folder for me." Type `/說明` to list all features and commands.

---

## Q: I messed up my settings — how do I go back?

Tell Claude "remove the beginner kit and restore my original settings," or run `bash uninstall.sh` yourself. Your original settings were backed up at install time, so it **fully reverts** to how it was before.
