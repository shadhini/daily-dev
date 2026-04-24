# `chmod`

- changes the permission mode of files and directories (who can read, write, or execute them)
- does not change file ownership (`chown` does that) and requires you to be the file owner or root

## numeric modes
- Each digit is octal: user (owner), group, others 
- Bits: read=4, write=2, execute=1. Sum them. 
  - 7 = 4+2+1 = rwx 
  - 6 = 4+2 = rw-
  - 5 = 4+1 = r-x
  - 4 = 4 = r--

e.g: 755 → rwxr-xr-x (owner rwx, group r-x, others r-x) 

## symbolic mode details
- Classes: u (user), g (group), o (others), a (all).
- Operators: + (add), - (remove), = (set exactly).
- Permissions letters: r, w, x.

Examples:
- chmod u+x file — add execute for owner
- chmod go-w file — remove write for group and others
- chmod a=r file — set everyone to read only
