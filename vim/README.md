# vim

It's not always possible to install your favorite editor on a machine. For times like that, there's `vim`.

# Mode changes
to go to...
- command: Escape
- insert: i
- last-line: : (from command mode)


# Command Mode

## Moving Around

- 0 moves the cursor to the beginning of the line.
- $ moves the cursor to the end of the line.
- w move forward one word.
- b move backward one word.
- G move to the end of the file.
- gg move to the beginning of the file.
- `. move to the last edit.
- `<NUMBER> G` - go to line `<NUMBER>`

Prefacing a movement command with a number will execute that movement multiple times. So, if you want to move up six lines, enter 6k.

## Editing

- x - delete character
- d starts the delete operation
- dw will delete a word.
- d0 will delete to the beginning of a line.
- d$ will delete to the end of a line.
- dgg will delete to the beginning of the file.
- dG will delete to the end of the file.
- u will undo the last operation.
- Ctrl-r will redo the last undo.

## Search & Replace

- /text search for text in the document, going forward.
- n move the cursor to the next instance of the text from the last search. This will wrap to the beginning of the document.
- N move the cursor to the previous instance of the text from the last search.
- ?text search for text in the document, going backwards.
- :%s/text/replacement text/g search through the entire document for text and replace it with replacement text.
- :%s/text/replacement text/gc search through the entire document and confirm before replacing text.

## Copy & Paste

- v highlight one character at a time.
- V highlight one line at a time.
- Ctrl-v highlight by columns.
- p paste text after the current line.
- P paste text on the current line.
- y yank text into the copy buffer.


# Last-Line mode:

:w - write to file
:q - quit
