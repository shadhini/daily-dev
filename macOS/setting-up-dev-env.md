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
    - install extensions: `Markdown All in One`, `Git Graph`,`GitLens`, `Docker`, `Dev Containers`
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
    - plugins: `Github Copilot`, 
- `Github Copilot CLI`
    - `brew install copilot-cli`
- `GCM: Git Credential Manager`
    - `brew install --cask git-credential-manager-core`
    - Setup git - [configure git and git signing](https://github.com/shadhini/daily-dev/blob/main/git-commands/signing-commits-and-git-configurations.md)
- `python`
  - `brew install python@3.11`
  - `python3.11`: opens python 3.11 interpreter
- `Docker Desktop`
  - download from the web
