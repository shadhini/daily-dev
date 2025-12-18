# Bash Shell Commands
`sh`

## Process Management

find processes running on a specific **port**

    lsof -i :<PORT_NUMBER>
---
    lsof -i :8080


find a process by name

    ps aux | grep <PROCESS_NAME>
---
    ps aux | grep mysql


kill a process

    kill -9 <PID>
---
    kill -9 1234


## File/Directory Management

create directory

    mkdir -p ~/myCA/newcerts ~/myCA/private

- `-p`: makes mkdir create parent directories as needed and be forgiving if directories already exist

### `chmod`

- changes the permission mode of files and directories (who can read, write, or execute them)
- does not change file ownership (`chown` does that) and requires you to be the file owner or root

### numeric modes
- Each digit is octal: user (owner), group, others 
- Bits: read=4, write=2, execute=1. Sum them. 
  - 7 = 4+2+1 = rwx 
  - 6 = 4+2 = rw-
  - 5 = 4+1 = r-x
  - 4 = 4 = r--

e.g: 755 → rwxr-xr-x (owner rwx, group r-x, others r-x) 

### symbolic mode details
- Classes: u (user), g (group), o (others), a (all).
- Operators: + (add), - (remove), = (set exactly).
- Permissions letters: r, w, x.

Examples:
- chmod u+x file — add execute for owner
- chmod go-w file — remove write for group and others
- chmod a=r file — set everyone to read only

## File writing/modifying

create a file and write the output to it 

    echo "This is a test file for hashing." > testfile.txt

append a new line to an existing file

    echo "Another line of text." >> testfile.txt

## Comparing Files

to confirm that 2 files are identical

    sha256sum <FILE_1> <FILE_2>

compare differences

    diff <FILE_1> <FILE_2>
    cmp <FILE_1> <FILE_2>

