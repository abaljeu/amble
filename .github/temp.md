## 2. Architectural Patterns (Min Fork)
- Main process entry: `minbrowser/main/main.js` creates `BaseWindow` and injects a single `WebContentsView` loading `min://app/index.html` (custom protocol via `registerBundleProtocol`). When adding main-process features, mirror existing patterns: create helper in `main/*.js`, import in `main.js`, wire IPC.
- Renderer/UI modules: `minbrowser/js/` is organized by domain (e.g. `webviews.js`, `navbar/`, `searchbar/`, `taskOverlay/`). Each module manages a narrow concern; state is often held in plain JS objects (e.g. `tabs`, `tasks`, `settings`). Follow this modular split instead of monolithic files.
- State & actions: Functions like `addTab`, `closeTab`, `addTask` in `browserUI.js` encapsulate user actions and update both state collections and DOM/UI. When adding new actions, co-locate them with related domain file and expose a simple function (no classes) consistent with existing style.
- IPC pattern: Use helper `sendIPCToWindow` in main to queue messages until the window is ready. On renderer side, corresponding listeners update UI/state. Reuse this queueing logic; do NOT directly access `webContents` unless necessary.

## 5. Build & Run Workflows
- Amber React app: standard ERB commands (`npm start`, `npm run package`). Validate changes with `npm test` if tests present in `amber-react/src/__tests__/`.
- Min fork: install deps (`npm install` in `minbrowser/`), run dev with `npm run start` (see upstream README). Platform packaging via scripts (`buildWindows`, etc.). Keep added scripts minimal and consistent naming (`buildSomething` camelCase).
- New prototype: pure static assets; no build pipeline required initially. Serve via a simple static server (optionally add a lightweight `npm run dev:nav` using `http-server` if needed later).

## 6. Adding Features Safely
When extending Min code:
- Touch one concern per file; if adding download logic, put in `main/download*.js` or existing `download.js` if directly related.
- Reuse existing window/message lifecycle guards (check `window.isDestroyed()`, `isLoadingMainFrame()` same as `sendIPCToWindow`).
- For new renderer UI, follow folder pattern (`minbrowser/js/<domain>/`). Export functions at top-level; avoid deep relative paths by using existing require alias style.

## 7. IPC & Protocol Notes
- Custom protocol `min://` used for internal pages. When adding internal pages, register via existing bundle protocol mechanism instead of `file://` loads for security (avoid nodeIntegration leaks to remote content).
- Prevent navigation to remote URLs from privileged renderer (`will-navigate` handler). Preserve/extend this safeguard for any new internal windows.

## 8. Styling & Theming
- Min uses light/dark theme switching (`themeMain.js`, `nativeTheme`). If adding UI, prefer CSS variables and consult existing classes for theme-aware colors. Avoid hard-coded colors; inherit where possible.
