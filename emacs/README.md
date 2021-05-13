# emacs notes

## Keyboard Shortcuts & Usage Notes
(far from complete, and customized for the `init.el` file in this repo)

Reading this guide:
- `C-x` is Ctrl + x
- `M-x` is Alt + x


**close emacs** - `C-x C-c`

**cancel current command** - `C-g`



### File Manipulation
- **open file**: C-x C-f
- **save file**: C-x C-s
- **close file**: C-x k


### Window Management
- **split window vertically**: - `C-x 3`
- **split window horizontally**: - `C-x 2`
- **move between windows**: - `Shift + arrow key`
- **close window**: `C-x 0`


### Editing
- **search file**: `C-s` (forward) or `C-r` (backward)
- **search & replace**: `Alt + Shift + 5`
- **set mark**: `C- Space`
- **auto-complete**: `Alt + Enter`
- **go to line**: `Alt + G`
- undo: `C-z` **CHANGE THIS: moves emacs to background when run in terminal**

### Packages
- **open package manager**: `M-x list-packages`
- **mark for install**: `i`
- **unmark**: `u`
- **mark for deletion**: `d`
- **execute**: `x`


### Miscellaneous
- **switch between .cpp and .h file**: `F7`
- **highlight misspelled words**: `M-x flyspell-mode`
- **open a file as sudo**: `C-x C-f /sudo::/path/to/file`
- **run make**: `F9`


## TODO

packages:
- preview Markdown (maybe `gh-md` or `markdown-mode`) - get them to work


python:
- indent and de-indent keyboard shortcuts
- intelligent suggestion (based on class definitions)


editing:
- multiple cursors - see https://www.gnu.org/savannah-checkouts/gnu/emacs/videos/emacs-rocks-13.ogg
- always indent to two spaces
- go to function definition (specific to each language?)
- show a line at 80 characters


javascript:
- fix indentation issues (see learning-JS repo)
-


harmonize keyboard shortcut to move between windows with Atom?
Atom uses Alt+direction, emacs Shift+direction
