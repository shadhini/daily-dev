# IntelliJ IDEA Keyboard Shortcuts Reference


---

## 1. Project & File Navigation

- `command` + `I` → Project View
- `command` + `E` → Show recently opened files
- `command` + `shift` + `E` → Discover your code in recently visited files
- `command` + `O` → Search Classes
- `shift` + `command` + `O` → Search Files
- `command` + `9` → Project History
- `command` + `fn` + `F12` → Open file structure
- `command` + 7 → File structure as a tool window
- `command` + 3 → Open the Find window

---

## 2. Search / Find / Replace / Jump

### Global Search

- `shift` + `shift` → Search everywhere
  - Toggle Case
  - About
  - Show Line Numbers

- `command` + `shift` + `F` → Find in all files
- `command` + `shift` + `R` → Replace in all files
- `command` + `shit` + `A` → Find Action
  - Open in Terminal

### In-file Search

- `command` + `F` → Full text search in the current file
  - `command` + `G` OR `return` → Find next occurrence of the search term
  - `shift` + `command` + `G` → Find previous occurrence of the search term

### Navigation & Usages

- `command` + `P` → See method signature
- `command` + `B` → Jump to declaration of a method; repeat for all usages
- `option` + `command` + `O` → Search Methods
- `option` + `command` + `B` → Look for implementations of a method
- `command` + `U` → Go to super method from derived method
- `shift` + `command` + `H` → Show Hierarchy of the method at caret
- `option` + `fn` + `F7` → Detailed view of usages for method at caret
- `fn` + `F1` → Show Documentation, Preview for symbol at caret
- `fn` + `option` + `space` → See definition of symbol at caret
- `shift` + `command` + `fn` + `F7` → Show Usages of symbol at caret
- `control` + `H` → Show Type Hierarchy of symbol at caret

### Misc

- Pin `Find` Tab to stop it from getting overridden by next find operation.
- `shift` + `ESC` → Hide the window / Exit view mode

---

## 3. Error Handling & Warnings

- `fn` + `F2` → Go to next highlighted error in the file
  - `option` + `return` → View options for highlighted error
  - `fn` + `F1` + `command` → See short description
  - `fn` + `F1` + `command` → Expand description
- `option` + `return` → Preview Warnings

---

## 4. Code Selection & Deselect

### String Selection

- `option` + `up arrow` → Select word under caret
- `option` + `up arrow` x2 → Select whole string
- `option` + `up arrow` x3 → Select including quotes
- `option` + `up arrow` x4 → Select all string within line
- `option` + `up arrow` x5 → Select whole line
- `option` + `up arrow` x6 → Select whole file

### Line/Block Selection

- `shift` + `up arrow` x2 → Select 2 lines above
- `option` + `down arrow` xX → Shrink selection step by step

### Selection in Code Blocks

- On `if` block: `option` + `up arrow` x2 → Select whole `if` block

### Symbol Selection

- `control` + `G` → Select symbol at caret
- `control` + `G` x2 → Select next occurrence of symbol at caret
- `control` + `command` + `G` → Select all occurrences of symbol at caret
- `control` + `shift` + `G` → Deselect last occurrence of symbol at caret

---

## 5. Code Editing

### Comment / Uncomment

- `command` + `/` → Comment / Uncomment line
- Select code + `option` + `command` + `/` → Block comment/uncomment

### Copy / Paste / Duplicate / Delete

- `command` + `D` → Duplicate line at caret
- Select code + `command` + `D` → Duplicate selected code
- `command` + `delete` → Delete line at caret

### Move Up / Down

- `shift` + `option` + `up arrow` → Move line up
- `shift` + `option` + `down arrow` → Move line down
- `shift` + `command` + `up arrow` → Move method up
- `shift` + `command` + `down arrow` → Move method down

### Collapse / Expand

- `command` + `-` → Collapse code
- `command` + `=` → Expand code
- `command` + `shift` + `-` → Collapse all
- `command` + `shift` + `=` → Expand all

### Surround / Unwrap Code

- `option` + `command` + `T` → Surround selected code with template code
- `shift` + `command` + `fn` + `delete` → Unwrap template code

---

## 6. Code Completion

- `control` + `fn` + `space` → Activate Basic Completion
  - Select suggestion, press `tab` to insert
- (`control` + `fn` + `space`) x2 → Suggestions for static constants or methods
- `control` + `fn` + `shift` + `space` → List type-matching completions
- `shift` + `command` + `return` → Complete Statement
- `shift` + `command`+ `return` @ end of line / if/for/goto block → Complete Statement

---

## 7. Refactoring

### Variable Related

- `shift` + `fn` + `F6` → Rename variable
- `option` + `command` + `V` → Extract local variable from selected expression

### Method Related

- `option` + `command` + `M` → Extract selected code block into method
- Select code + `control` + `T` → Refactor code; list of options:
  - `iv`: inline variable
  - `ip`: introduce parameter
  - `ic`: introduce constant
  - `im`: introduce method

---

## 8. Reformatting

- `option` + `command` + `L` → Reformat selected code; if none selected, reformat whole file
- `option` + `command` + `shift` + `L` → Show reformat settings

---

## 9. Window Management & Miscellaneous

- Exit immediate window → `shift` + `ESC`
- Close all editor tabs → `ESC` x2

---

## 10. Cascaded Annotation

- Exit from immediate → `shift` + `ESC`
- Close all opened editor tabs → `ESC` x2

---
