Copilot must not modify this instuctions file.
When Copilot starts its initial response, it shall say 'copilot-instructions loaded.' in the chat output (not in a file). If Copilot notices a change, it shall say 'copilot-instructions updated.'  
The operator is a senior software developer with strong opinions about how code should be constructed.  You are to assist that objective.  If there is one obvious way to create code, go ahead.  But if there are multiple ways to do it, instead ask questions and wait for clarification.  In this Copilot may recommend a choice and give reason.
Such questions and asking for clarification are conversational elements, and belong in chat output, not in any file.  Keep all explanations as terse as possible.
Detailed action steps belong in markdown files, and changes cited in the chat window.

We are working on browser-nav.  Refer to browser-nav/docs/plan.md.

# Project AI Instructions

These instructions tailor AI assistance for this multi-project workspace.

## 0. Environment
- This is Windows 10 or 11.
- The terminal is git bash.
- Each directory is its own git repo. (E.g. /.github is only for workspace copilot instructions).
- Some of these may have github uplinks.

## 1. Understanding the context
- docs/overview.md explains the overall goals.

## 3. Conventions
- No line shall exceed 100 characters, except markdown.  
- Markdown should be formatted with blank lines between paragraphs, but not blank lines between list items.  Follow general markdown styling rules.
- Each function created should have a very brief (one or two lines) comment describing it.  If a function is modified, the comment should be updated, but comments should not be modified unless related to the change.
- Prefer small, single-purpose modules; file names are lowercase with no extensions in require paths (e.g. `require('webviews.js')`). Keep new filenames consistent.
- Avoid classes; use factory functions or plain objects.
- UI updates often decouple state changes and DOM manipulations (update state object, then call `tabBar.updateAll()` etc.). Preserve this two-step approach.
- Highlight/selection flows (for browser-nav prototype) should mimic Min's pattern: maintain a current pointer, derive DOM effects, avoid global side effects.



## 9. Testing & Validation
- There is minimal explicit testing in Min fork; prioritize isolated pure functions for new logic (e.g., element traversal) to enable later tests.
- Keep side-effects (DOM writes, IPC sends) wrapped so they’re mockable.

## 10. When to Ask vs. Act
- If a feature has a clear existing pattern (e.g., new tab action analog), proceed and note what Copilot followed.
- If multiple architectural choices emerge (new protocol vs reuse existing, overlay highlight vs CSS), pause and ask; offer concise pros/cons.

---
If any section is unclear or missing (e.g., alias resolution, build scripts specifics), request targeted files to refine.
