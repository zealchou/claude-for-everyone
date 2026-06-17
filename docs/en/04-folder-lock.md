# 04 · The Folder Safety Lock

> 🌐 [中文](../04-資料夾安全鎖.md) · **English**

## What it does

It protects the folders you **absolutely don't want touched by accident**: the AI can **read** what's inside, but the moment it tries to "modify / delete / move / overwrite," it's blocked on the spot.

**Like** locking an important cabinet — the AI has a key to open and look, but can't move anything inside. You can also leave one "scratch drawer" where it's allowed to put things.

## It's "nothing locked" by default

After install, the lock protects **no folder by default** (very safe, never gets in your way). It only activates once you specify a folder.

## How do I choose a folder to protect?

Easiest: just tell Claude, for example:

> "Make the company folder on my drive read-only, and only allow writing to the 'scratch' subfolder."

You only need to say the **folder name** — Claude knows to edit the active lock (at `~/.claude/hooks/folder-guard.sh`), which has two settings:

- **Protected folder**: locked to read-only (use the full path; if unsure, drag the folder onto Claude and it'll handle it)
- **The one writable subfolder**: a drawer for it to put things in (leave it out if you don't need one)

## How does it decide whether to block?

- You're just **reading / viewing** → always allowed, never bothers you
- The AI tries to **change, delete, move, or overwrite** something in the protected area → blocked, with a plain-language reason
- Touching the "writable subfolder" → allowed

By design it errs on the side of "block rather than miss" — protecting your data comes first.

## Want to remove or adjust it?

Just tell Claude "remove the safety lock" or "switch it to protect a different folder."
