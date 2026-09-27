# AtomicOS

AtomicOS is a local AI coding workspace that runs on your own machine through LM Studio. You describe a task, and three models work through it one small step at a time: a planner splits the task into atomic steps, a coder writes each one, and a reviewer checks it. Simple, exact jobs like arithmetic and file listing are handled by the built-in kernel instead of a model, so they're instant and always correct.

Everything lives in one file, `AtomicOS.cmd`. Double-click it and the app opens in your browser. Nothing is sent anywhere except to LM Studio on `localhost`.

## Requirements

- Windows 10 or 11
- [LM Studio](https://lmstudio.ai) with at least one chat model downloaded
- Chrome or Edge as your default browser (needed to read and write folders; Firefox can chat but can't use folders)

## Quick start

1. In LM Studio, open the **Developer** tab, load a model, and start the server on port `1234`.
2. In LM Studio's server settings, turn on **Enable CORS**. Without this the app can't connect.
3. Double-click `AtomicOS.cmd`. The status pill in the top bar turns green and reads **LM Studio Online**.
4. Pick a model for **Planner**, **Coder** and **Reviewer**. One model for all three is fine.
5. Click **Folders** and choose a **Project** folder (where code is saved) and a **Memory** folder (where notes are saved). Both are optional.
6. Type a task, such as `build a snake game`, and press Enter.

## What happens when you send a message

The app decides how to handle each message in this order.

**Kernel commands** run instantly, without a model:

| Command | What it does |
| --- | --- |
| `calc 15% of 850` | Exact arithmetic. Supports `+ - * / ( )`, `^` for powers, `x` between numbers, and "N% of M". |
| `ls`, `dir` or `files` | Lists the files in the project folder. |
| `clear` | Clears the chat and its history. |

**Build tasks** start the pipeline. A message counts as a build task when it contains a word like *build, create, make, develop, implement, code, write, generate* or *design*, and all three model slots are filled.

**Everything else** is a normal chat with the Planner model. Relevant memory notes are added to its context automatically.

## The pipeline

1. **Plan.** The planner returns up to 15 steps, each with a title, a description and a target file (for example `game/index.html`).
2. **Code.** For each step, the coder sees the whole plan, the current step, a list of files written so far, and the full current contents of the target file. It returns the complete updated file. Several steps can build up the same file without overwriting each other's work.
3. **Sandbox check.** `.js` and `.html` output is run for two seconds in an isolated frame that can't reach the app or your files. Runtime errors appear in the chat and are passed to the reviewer. Node-style code (`require`, `import`, `process`) is skipped, since it can't run in a browser.
4. **Review.** The reviewer comments and ends with `VERDICT: APPROVED` or `VERDICT: REVISION_NEEDED`. Each step card shows the result.
5. **Save.** Each file is written to the project folder as soon as its step is coded, creating subfolders as needed. With no project folder, you get download buttons at the end instead.

Click **Cancel** on the pipeline bar to stop the current request and end the run.

If a target file already exists in the project folder, the pipeline starts from that file. Choose an empty folder for a fresh build, or an existing one to upgrade a project.

## Memory vault

The memory folder holds plain Markdown notes with a small header, so it opens cleanly in Obsidian:

```markdown
---
title: Snake game controls
tags: [pipeline, ok]
date: 2026-09-27
---
Arrow keys move, space pauses.
```

- **+ New** in the Memory panel creates a note. Clicking a note opens it for editing.
- Each pipeline run saves its plan and every step as timestamped notes.
- For every message, up to five notes that share keywords with it are added to the model's context.

**Housekeeper** (top bar) asks the Planner model to tidy the vault. It merges duplicate notes, adds `[[wiki-links]]` between related ones, and deletes empty ones. For safety, it only deletes notes that are actually empty, never merges notes too long to show the model in full, and never overwrites a note that isn't part of the merge.

## Panels and shortcuts

- **Memory** and **Files** show or hide the side panels. Click a file to preview it.
- **Kernel** shows a log of kernel commands, model calls and sandbox results.
- **Folders** (or `Ctrl + ,`) sets the memory and project folders.
- `Enter` sends, `Shift + Enter` adds a new line, and `Esc` closes dialogs.

## Settings

These values are near the top of the `<script>` section in `AtomicOS.cmd` and can be edited in any text editor:

| Setting | Default | Where |
| --- | --- | --- |
| LM Studio address | `http://localhost:1234/v1` | `const API` |
| Temperature | `0.3` | `callLLM` |
| Max reply length | `8192` tokens | `callLLM` |
| File contents sent to coder and reviewer | 24,000 characters | `CAP` in `runPipe` |

If you edit the file, keep the first five lines as they are and keep Windows (CRLF) line endings.

## Troubleshooting

**Stuck on "Reconnecting…".** Make sure the LM Studio server is running on port 1234 and **Enable CORS** is on, then click **Refresh**.

**Folder buttons do nothing or show an error.** Your default browser is probably Firefox. Set Chrome or Edge as the default, or open `%TEMP%\AtomicOS.html` in one of them.

**Emoji show as symbols like `âš›ï¸`.** You're running an older copy of the launcher. Use the current `AtomicOS.cmd`.

**"Could not parse the plan".** The planner didn't return valid JSON. Try again, or use a larger or instruction-tuned model as Planner.

**Steps fail or come back cut off.** The model's context window is too small for the file plus the plan. Raise the context length when loading the model in LM Studio.

**Windows warns before opening the file.** SmartScreen flags downloaded `.cmd` files. Choose **More info → Run anyway**, or right-click the file, open **Properties**, and tick **Unblock**.

## How the launcher works

`AtomicOS.cmd` is a batch script with the app attached below it. When you run it, PowerShell copies everything from the `<!DOCTYPE html>` line onward into `%TEMP%\AtomicOS.html` and opens that in your default browser. The file is overwritten on each launch, so nothing builds up in your temp folder.

## Known limitations

- Memory search matches keywords, not meaning.
- Generated code that loops forever may briefly freeze the tab during the sandbox check.
- Steps are reviewed but not automatically revised. A step marked **Needs revision** is saved as written.
