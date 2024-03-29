## Vim Cheat Sheet

### Navigation

- End of the file: shift + g
- Next line: j
- Go down a defined number of lines: number + j
- Skip to next word: w
- Skip back a word: b
- Skip to next section: W
- Skip back to previous section: B
- Go to end of the line: \$
- Go to beginning of the line: 0
- Go to top of the screen: shift + h
- Go to top of the middle: shift + m
- Go to bottom of the screen: shift + l
- Forward multiple words: 5w
- Forward multiple letters: 5l
- Back multiple letters: 5h
- Forward to the next 'y': fy (case sensitive)
- Scroll the window down: ctrl + e
- Scroll the window up: ctrl + y
- Scroll down one page: ctrl + f
- Scroll the window up: ctrl + b
- Swap window
  - Navigate to the window you'd like to move
  - Press `<leader>ww`
  - Navigate to the window you'd like to swap with
- Go to next fold: zj
- Go to previous fold: zk

- Go to previous position: ctrl + o
- Go to forward position: ctrl + i
- Go to previous position edits: g;
- Go to recent position edits, opposite of `g;`: g,

- Switch current window to right: ctrl w + L
- Switch current window to left: ctrl w + H
- Switch current window to top: ctrl w + K
- Switch current window to bottom: ctrl w + J

<!-- prettier-ignore -->
- In insert mode: jump out of parenthesis/brackets/quotes/etc: ctrl g + g (need Raimondi/delimitMate)

### Editing

- Undo: u
- Redo: ctrl + r
- Inserting text where the cursor is: i
- Inserting text at the start of the line: I
- Insert at the end of the line: shift + a
- Copy entire line: yy or Y
- Paste copied line: p
- Change multiple words: 5cw
- Insert at the end of the line: A
- Delete full word and replace: c + a + w
- Changes 'surroundings': for examples from "hello" to 'hello': c s " '
- Open and close fold: za
  - close fold: zc
  - close all fold: zC
  - open fold: zo
  - open all fold: zO
- Add word to vim dictionary as good word: zg
- Remove word from vim dictionary good word: zug
- Add word to vim dictionary as wrong word: zw
- Remove word from vim dictionary wrong word: zuw
- Get suggestions on edit: ctrl+n and ctrl+p
- Get suggestions on fix wrong word: ctrl+x ctrl+s on edit
- Pick 1st suggestion on fix wrong word: space+z

### Deleting

- `d<leftArrow>` will delete current and left character
- d\$ will delete from current position to end of line
- d^ will delete from current backward to first non-white-space character
- d0 will delete from current backward to beginning of line
- dw deletes current to end of current word (including trailing space)
- db deletes current to beginning of current word
- Delete current line: dd
- Join the line below: shift + j
- Delete entire word: cw
- Delete to the end of the line: shift + C
- Delete multiple lines: d + number of lines + enter
- Delete from current position to a specific line number: `d<line number>G`
- Deleting all items in a file that start with a pattern:`:g/< search term>/d`
- Deleting all lines that are empty or that contain only whitespace:
  `:g/^\s\*\$/d`
- Deletes all text inside parenthesis/brackets: d + i + item / or { or [
- Deletes all text inside parenthesis/brackets INCLUDES: d + a + item / or { or
  [
- Deletes all text inside parenthesis/brackets AND INSERT: c + i + item / or {
  or [
- Deletes all text inside parenthesis/brackets INCLUDES AND INSERT: c + a + item
  / or { or [

### Selecting

- Select the entire line: V
- Select a range of text: v
- Select a column: control + v
- Reselect a block: gv
- Select all: ggVG
- Select all inside element like { ( " ' : v + i + item
- Select all inside element like { ( " ' WITH the element: v + a + item
- Select block of code: v i p

### Find and Replace

- %s/pattern/text to replace
- %s/pattern/text/g to replace all occurence
- 6,10s/pattern/text/g to replace all occurence from line 6 to 10

### Saving

- Save the file: :w
- Save the file and quit: :wq
- Quit without saving: :q!
- Quit vim without saving with error code (default to 1). Useful when Vim is
  called from another program (ex: `git editlastcommit`): :cq!

### Views

- Use horizontal split: :sp filename
- Use vertical split: :vsp filename
- Switch from top to bottom: ctrl w + j
- Switch from left to right: ctrl w + l
- Switch from bottom to top: ctrl w + j
- Switch from right to left: ctrl w + h
- Resize window: ctrl w > AND ctrl w <

### Search

- While on current line: `f + <queried item>`
- Search for word in file: /word + enter
- Find next search result: n
- Search backwards: N
- Go to first result: ggn
- Go to last result: GN
- To remove search highlighting: ctrl l

### Modes

- Normal
- Insert
- Visual
- Replace
- Command Line

### Multiple Files

- :e filename - Edit a file in a new buffer
- :bnext (or :bn) - go to next buffer
- :bprev (of :bp) - go to previous buffer
- :bd - delete a buffer (close a file)
- :sp filename - Open a file in a new buffer and split window
- ctrl w + s - Split windows
- ctrl w + w - switch between windows
- ctrl w + q - Quit a window
- ctrl w + v - Split windows vertically

### Indenting

- Fix indenting when pasting: set paste in .vimrc file
- Indenting: visual mode + > or <
- Repeat indenting: .

## Commenting/Uncommenting

- Comment: visual block select with CTRL-V then I# (insert # in the begining)
- Uncomment: visual block select with CTRL-V then X (delete the first symbol on
  the line)

- Comment: `<leader> c c`
- Uncomment: `<leader> c u`

### Visual Mode

- Changing multiple lines of text: control + v + shift + i + action + esc
- Select elements in paragraph: v + / + content

### Display settings

- Turning on line numbers: :set nu
- Turning on syntax highlighting: :syntax on

### Reseting Vim Settings

```
cd
mv .vimrc .vimrc-old
mv .vim .vim-old
touch .vimrc; mkdir .vim
```

### Help

- To get help: :h <topic>
- To exit help: :bd

### Removing blocks of text in code files

- `c + i + t` will remove the code between HTML tags, such as:
  `<div>Some content</div>`
- `c + i + }` will remove the code inside of a JavaScript function

### Basic autocomplete

- ctrl + n - autocomplete
- ctrl + x + ctrl + n - autocomplete only from this file

### Preview Markdown

- ctrl + m

### Git add part of hunk (GitGutter)

To stage part of any hunk:

<!-- prettier-ignore -->
- preview the hunk, e.g. <Leader>hp
- move to the preview window, e.g. :wincmd P or move inside with the mouse cursor
- delete the lines you do not want to stage
- stage the remaining lines: either write (:w) the window or stage via <Leader>hs or :GitGutterStageHunk.

### Prettier

- Save without formatting :noa w
