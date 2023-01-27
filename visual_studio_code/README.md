# Visual Studio Code

To install Visual Studio Code, run `./install.sh`

To sync all settings, open the GUI and sign-in with your Github account.



## Keybindings

These are some Keybindings I used frequently.

**Standard keybindings:**

[Official Cheat Sheet](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf)

- Command pallette: Ctrl + Shift + P
- Quick Open: Ctrl + P
- Open folder: Ctrl + K , Ctrl + O
- Ctrl + K Ctrl + S: open keyboard shortcuts list
- Ctrl + K Ctrl + X: trim trailing whitespace
- Cut line: Ctrl + X
- autoindent document: Ctrl + Shift + I
- fold/unfold expand/collapse code section: Ctrl + Shift + `[` or `]`
- preview markdown: Ctrl + Shift + V
- find in project: Ctrl + Shift + F
- add multiple cursors: Ctrl + Alt + Up/Down
- show function paremeter hints: Ctrl + Shift + Space
- align on characters (e.g. by =): Alt + = (from Alignment extension)
- show inlay hints: Ctrl + Alt (while held)
- duplicate a line: Shift + Alt + up/down
- search through all files in open project: Ctrl + Shift + F
- go to function or variable definition: F12


**Editor panes & tabs**

- Split editor vertically: Ctrl + \
- Split editor horizontally: Ctrl + K  Ctrl + \
- Go to specific pane: Ctrl + 1 / 2 / 3 ...
- Go to next editor: Ctrl + PageDown
- Go to previous editor: Ctrl + PageUp
- Close editor (tab): Ctrl + W
- Ctrl+K W: close all editors (tabs) in the pane
- Zen mode: Ctrl+K Z


**Custom keybindings:**

- Make current window bigger: Alt + ]
- Make current window smaller: Alt + [
- center window on cursor: Ctrl + L
- duplicate selection: Ctrl + Shift + D


**Built-in Terminal**

- open new terminal: Ctrl + Shift + `
- make active an already-open terminal: Ctrl + `
- split terminal vertically (when terminal is selected): Ctrl + Shift + 5


## Working in WSL

Follow this process: https://code.visualstudio.com/docs/remote/wsl


## Python workflows

- [Linting](https://code.visualstudio.com/docs/python/linting)
  - [How to use a specific `pylintrc` file](https://stackoverflow.com/a/64200814/)
- [Debugging](https://code.visualstudio.com/docs/python/debugging)
- use `Python: Select Interpreter` command to set interpreter (e.g. to use a virtual env)
- run selected code in python terminal: `Shift + Enter`
- rename a module: right-click in the code explorer --> rename --> follow prompts
- sort import: run `Python Refactor: Sort Imports` command
- [working with Jupyter notebooks](https://code.visualstudio.com/docs/python/jupyter-support-py)

