# Git Commit Warning: CRLF line separators

Warning Example:

```text
⚠️ Line Separators Warning
You are about to commit CRLF line separators to the Git repository.
It is recommended to set the core. autocrlf Git attribute to input to avoid line separator issues.
If you choose Fix and Commit, git config --global core.autocrlf input will be executed.
If you choose Commit As Is, the config value won't be changed.
```

## Why This Warning Happens

This warning happens because Windows and Unix-based systems (like Mac and Linux) handle the invisible characters 
at the end of text lines differently.

* Windows uses `CRLF` (Carriage Return + Line Feed).
* Mac/Linux use `LF` (Line Feed). 

When you share code, these mixed line endings can cause Git to show changes on every single line of a file. 

## The Best Fix
Click `Fix and Commit` in your code editor/IDE window.
- This tells Git to automatically convert your Windows line endings (`CRLF`) into Unix line endings (`LF`) 
whenever you save your work to the repository. 
- Your local files will stay normal, but the repository will stay clean and compatible for everyone. 

## Manual Terminal Alternative
 
You can fix this by running these terminal commands:

* If you are on Windows:

        git config --global core.autocrlf true

(converts LF to CRLF when checking out code, and CRLF to LF when committing)

* If you are on Mac or Linux:

        git config --global core.autocrlf input

(only converts CRLF to LF when committing, keeping LF locally)  



