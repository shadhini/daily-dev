# `zsh`: Z shell

`powerful interactive Unix shell and scripting language`
- a modern alternative to bash with many convenience features for interactive use (better completion, globbing, prompts, and customization)
- Default on macOS since Catalina (replaced bash as the login/interactive shell)


# How it starts up (important files) 

Order for interactive login shells roughly:

- `/etc/zshenv`
- `~/.zshenv` — always read, for environment variables you need everywhere (be conservative)
- `/etc/zprofile`
- `~/.zprofile` — read for login shells (good place for PATH modifications, e.g: Homebrew)
- `/etc/zshrc`
- `~/.zshrc` — read for interactive shells (good place for aliases, completions, prompt, compinit)
- `/etc/zlogin`
- `~/.zlogin` — read after ~/.zprofile for login shells (rarely used)
- `~/.zlogout` — read at logout
  
Use 
- `~/.zprofile` for PATH and environment set-up for login shells
- `~/.zshrc` for interactive settings (prompt, completions, aliases)

# Commands

zsh manual: 

    man zsh
