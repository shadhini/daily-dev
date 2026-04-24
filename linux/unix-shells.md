# Shell

`a command‑line program that provides a user interface to the operating system`
- role: sits between you and the kernel
- you type commands (or run scripts) and the shell interprets them, launches programs, handles I/O redirection, pipes, job control, and variable expansion

## Interactive vs Non-interactive Shells

- Interactive shell: you type commands at a prompt 
  - e.g: a terminal session
- Non‑interactive shell: runs a script 
  - e.g: startup scripts, cron jobs

## Common Unix shells:
- `sh` (Bourne shell / POSIX sh) — the portable standard for scripts
  - language standard for basic shell behavior
  - supported by many shells (`dash`, `ash`, `bash` in POSIX mode)
- `bash` (Bourne Again SHell) — very common, many extensions
- `zsh` — feature-rich, highly configurable (default on macOS)
- `fish` — modern, user-friendly interactive features
- `ksh`, `tcsh` — other historical/featureful shells

## Shebang and scripts

A `shell script` begins with a `shebang` to select the interpreter:
- `#!/bin/sh` (POSIX shell)
- `#!/usr/bin/env bash` (Explicit Bash -- preferred if using bash features)
- `#!/bin/zsh` (Explicit Zsh -- preferred if using zsh features)

The shebang determines which shell runs the script and thus which features are available

## POSIX style shells
- `sh` is the standard POSIX shell, and scripts that use only POSIX features can run in any compliant shell
- `bash` and `zsh` support POSIX features but also have their own extensions, so scripts that use those extensions may not be portable to other shells without modification


## Detect which shell process is running

    echo $SHELL
    echo $0
    ps -p $$ -o comm= # shows the command name of your current shell process
    ps -o args= -p $$ # shows full args for the shell process

