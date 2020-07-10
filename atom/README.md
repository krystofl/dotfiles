# Atom

To install Atom, including my settings, keybindings, and packages, run `./install_atom.sh`

Docs are in the [flight manual](https://flight-manual.atom.io/getting-started/)


# Keybindings

- Ctrl+Shift+P - Command Palette
- Keybinding resolver: Ctrl+.
- settings: Ctrl+,
- change syntax highlighting mode: Ctrl-Shift-L

Working with files:
- Ctrl+Alt+O - advanced open file
- Ctrl+T - open files in current project
- Ctrl+Shift+B - show list of all untracked and modified files in repo
- Ctrl+Shift+A - open directory
- Ctrl+\ - show/hide the tree view
- Ctrl+P - open the Fuzzy Finder
- Close current buffer: Ctrl+W

Panes:
- Split pane: Ctrl+K <arrow>
- Close all items in a pane: Ctrl+K Ctrl+W
- Select a tab in the current editor window: Alt+<number>
- switching between panes: Alt+Up/Down/Left/Right
- grow pane  : ctrl-alt-=
- shrink pane: ctrl-alt--


## Editing
- Ctrl+G - go to row:col
- Navigate by symbol: Ctrl+R
- Go to function definition (python): Ctrl - Alt - G
- Select line: Ctrl+L
- Duplicate line: Ctrl+Shift+D
- Delete line: Ctrl+Shift+K
- Align multi-line selection - Ctrl+Alt+A (from atom-alignment)
- center editor window on cursor: Ctrl+L (from simple-center-screen)
-

Multiple cursors:
- Alt+Shift+Up/Down - Add another cursor above/below the current cursor
- Ctrl+Click - add a new cursor
- Ctrl+D - select the next word that is the same as the current word

Brackets:
- Ctrl+M - Jump to the bracket matching the one adjacent to the cursor. It - jumps to the nearest enclosing bracket when there's no adjacent bracket.
- Alt+Ctrl+, - Select all the text inside the current brackets
- Alt+Ctrl+. - Close the current XML/HTML tag

Search:
- Ctrl+F - Search within a buffer
- Ctrl+Shift+F - Search the entire project

Folding:
- Fold/Unfold: Alt+Ctrl+[ and Alt+Ctrl+]
- Fold/Unfold everything: Alt+Ctrl+Shift+[ and Alt+Ctrl+Shift+]

Prose:
- Ctrl+Shift+; - show possible corrections of misspelled word
- Ctrl+Shift+M - show Markdown preview



# Snippets

**Python**
- `env3` --> `#!/usr/bin/env python3`
- `ifmain` --> `if __name__ == '__main__':`



# Extensions
Extensions are automatically installed by `install_atom.sh`.

To update the list of installed extensions, run

    apm list --installed --bare > atom_packages.list


# TODO: Learn & Figure Out...
Navigating by symbols in entire projects using ctags: https://flight-manual.atom.io/using-atom/sections/moving-in-atom/#navigating-by-symbols

Snippets: https://flight-manual.atom.io/using-atom/sections/snippets/

Get commands to resize pane width and height independently via the keyboard:
https://github.com/atom/atom/issues/20558
Take a look at
[this pull request](https://github.com/atom/atom/pull/7354)
where the keyboard commands to grow/shrink panes were added.
At a glance, writing a plugin to do that should not be too hard.

Get a plugin to open a terminal
(atom-terminal-tab looks good except that you can't navigate from the terminal
pane using the keyboard. See https://github.com/jsmecham/atom-terminal-tab/issues/56)

Add keybinding for Find And Replace: Replace Next

Python type checking (looks like mypy is the way to go)

Make autocompletion less annoying:
- Disable python suggestions when I haven't typed anything yet
  (e.g. when I create an open parens after a function call)
- introduce a delay before showing the popup?

Install dockerlint (system package + atom plugin).
See https://atom.io/packages/linter-docker and
[Dockerfile best practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)

Get a way to open files using wildcard characters, e.g. *.yaml.
Probably extendeding
[Advanced Open File](https://atom.io/packages/advanced-open-file),
or finding an alternative, is the way to go.
