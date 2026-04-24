# General Notes: Software Installation

- software downloaded from the web (`.dmg` files)
    - install: drag the app to the Applications folder
    - verify checksum of downloaded file:
        - @ Terminal `shasum -a 256 <file-name>` : generate the SHA-256 checksum of the file
    - uninstall: drag the app from the Applications folder to the Trash / delete the app from the Applications folder
- software downloaded from the App Store
    - install: click the "Get" button in the App Store
    - uninstall: click the "X" button on the app icon in the Launchpad
- software installed via Homebrew: used for installing command-line tools and libraries -- `formulae`
    - install: `brew install <package-name>` 
    - uninstall: `brew uninstall <package-name>`
- software installed via Homebrew Cask: used for installing GUI applications and large binaries -- `casks`
    - install: `brew install --cask <package-name>` 
    - uninstall: `brew uninstall --cask <package-name>` 
- `XCode Select`: used for managing multiple versions of Xcode and command-line tools
  - `homewbrew` relies on the command-line tools provided by Xcode, so you may need to install them using `xcode-select --install` when setting up Homebrew for the first time
    


# Installing must have software

- `Chrome` 
    - download from the web 
- `Visual Studio Code` 
    - download from the web
    - OR `brew install --cask visual-studio-code`
    - install extensions: `Markdown All in One`, `Git Graph`,`GitLens`, `Docker`, `Dev Containers`, `Markdown Preview Enhanced`, `Markdown PDF`
- `Homebrew`
    ```bash
    # install
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```
    - this script 
      - may ask for your password and will install `Xcode Command Line Tools` if they’re missing 
      - OR tell you to run `xcode-select --install`
      - At the end it prints commands you should run to add Homebrew to your shell environment
    ```bash
    # add Homebrew to your shell environment
    echo >> /Users/<USERNAME>/.zprofile
    echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> /Users/<USERNAME>/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv zsh)"

    # verify installation
    brew --version
    # optional health check
    brew doctor
    # update brew
    brew update
    # upgrade outdated formulae and casks
    brew upgrade
    # search
    brew search <PACKAGE-NAME>
    # list installed 
    brew list
    ```
    - this usually installs `git`, `python3`, and other command-line tools that are essential for development
- `iTerm2`
    - `brew install --cask iterm2`
- `PyCharm`
    - download from the web: professional version
    - plugins: `Github Copilot`, `Makefile Language`, 
- `Github Copilot CLI`
    - `brew install copilot-cli`
- `GCM: Git Credential Manager`
    - `brew install --cask git-credential-manager-core`
    - Setup git - [configure git and git signing](https://github.com/shadhini/daily-dev/blob/main/git-commands/signing-commits-and-git-configurations.md)
- `python`
  - `brew install python@3.11`
  - `python3.11`: opens python 3.11 interpreter
- `Zoom` 
  - download from the web
- `Docker Desktop`
  - download from the web: download the Apple Silicon version
  - prerequisites: 
    - @terminal: `softwareupdate --install-rosetta --agree-to-license`
    - Docker requires `Rosetta` because some of its internal helper tools are still built for Intel chips, and it uses `Rosetta` to allow you to run Intel-based containers alongside native ones. It essentially acts as a compatibility bridge to ensure all features and images work seamlessly on Apple Silicon.
  - post-installation: 
    - if `Docker Desktop` > `General` > `"Configure shell completions"` gives an error or warning
      - `mkdir -p ~/.zsh/completions` and try installing completions again via `Docker Desktop` > `General` > `"Configure shell completions"` 
      - [not necessary] `docker completion zsh > ~/.zsh/completions/_docker`
      - [not necessary] `vim ~/.zshrc` and add lines: `fpath=(~/.zsh/completions $fpath)`, `autoload -Uz compinit && compinit`
      - [not necessary] `source ~/.zshrc`
- `DBeaver`: cross platform database management tool
  - `brew install --cask dbeaver-community`
- `mysql`: install mysql server
  - `brew install mysql`
  - `brew services start mysql`
  - `mysql_secure_installation`: run this command to set the root password and secure your MySQL installation after installing the server
  - Start MySQL server: `brew services start mysql`
  - Stop MySQL server: `brew services stop mysql`

