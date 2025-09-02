# Amble Overview

Amble is a long-term meta project with an end goal of creating a tool that can:

- implicitly import many forms of textual data
- present that data using html
- efficiently navigate through all the information.
- edit that with powerful text-editor tools
- create new files or update the original data sources according to the edits.
- embed or call out to custom scripting to act on the information.

This main folder contains many subprojects which are either experiments or working pieces of the whole.



## Subprojects

### amber-react
Amber React is an Electron + React boilerplate fork, intended as the future shell/host for browser experiments and UI. It uses standard ERB scripts for development and packaging.

Main docs: [[../amber-react/docs/build-run.md]]


### minbrowser
Min Browser is a privacy-focused Electron browser fork, used as a reference for production-grade browser logic and UI patterns. It features modular JS domain files and custom protocol handling.

Main docs: [[minbrowser/docs/index.md]]


### browser-nav
Browser Navigator is a prototype for keyboard-driven DOM navigation, selection, and accessibility inspection. It is implemented as a Chrome extension and static assets, with incremental features tracked in its docs.

Main docs: [[browser-nav/docs/plan.md]]
