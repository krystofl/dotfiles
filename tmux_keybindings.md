# tmux keybindings

## Panes
- C-b % - split vertically **(change to not require holding shift?)**
- C-b " - split horizontally (change?)
- C-b <arrow> - navigate between panes
- C-b z - make a pane go fullscreen (Zen mode?)
- C-b C-<arrow> - resize pane in the direction of the arrow key

Ctrl+D to close a pane (just like closing a regular session).


## Windows
Windows in tmux work similarly to tabs in the terminal
(so why not just use those, one might ask?).

- C-b c - create new window
- C-b p - switch to previous window
- C-b n - switch to next window
- C-b <number> - switch to a specific window
- C-b , - rename current window


## Sessions
- C-b d - detach current session, leaving processes running in the background
- `tmux ls` - list sessions
- `tmux attach -t SOMENAME` - attach to session SOMENAME
   (from `tmux ls` output; default names are ints)
- `tmux new -s HACKING` - create a new session named HACKING
- `tmux rename-session -t 0 HACKING` - rename session 0 to HACKING
