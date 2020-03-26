# Atom

To install Atom, including my settings, keybindings, and packages, run `./install_atom.sh`

Docs are in the [flight manual](https://flight-manual.atom.io/getting-started/)


# Keybindings

- Ctrl+Shift+P - Command Palette
- Keybinding resolver: Ctrl+.
- settings: Ctrl+,

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


## Editing
- Ctrl+G - go to row:col
- Navigate by symbol: Ctrl+R
- Select line: Ctrl+L
- Duplicate line: Ctrl+Shift+D
- Delete line: Ctrl+Shift+K
- Align multi-line selection - Ctrl+Alt+A (from atom-alignment)
- center editor window on cursor: Ctrl+L (from simple-center-screen)

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


# Extensions
Extensions are automatically installed by `install_atom.sh`.

To update the list of installed extensions, run

    apm list --installed --bare > atom_packages.list


# TODO: Learn & Figure Out...
Navigating by symbols in entire projects using ctags: https://flight-manual.atom.io/using-atom/sections/moving-in-atom/#navigating-by-symbols

Snippets: https://flight-manual.atom.io/using-atom/sections/snippets/

Get commands to resize pane width and height independently via the keyboard:
https://github.com/atom/atom/issues/20558
