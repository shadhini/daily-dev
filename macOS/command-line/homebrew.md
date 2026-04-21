# Homebrew

`a package manager for macOS` 
- allows you to easily install and manage command-line tools, libraries, and applications

2 main types of software installed via Homebrew:
- `formulae`: software installed via Homebrew, used for installing command-line tools and libraries
    - `python`, `node`, `git`, `docker`, ...
    - generally for technical, text-based software used within a terminal
    - often compiled from source or using "bottles" (pre-built binaries)
    - Formulae in the core repository must be open-source
    - updated entirely through the brew upgrade command
    - installs into the Cellar (e.g., `/opt/homebrew/Cellar` on Apple Silicon)
    - install: `brew install <PACKAGE-NAME>` 
    - uninstall: `brew uninstall <PACKAGE-NAME>`
- `casks`: software installed via Homebrew Cask, used for installing GUI applications and large pre-compiled binaries
    - `google-chrome`, `visual-studio-code`, `iterm2`, `pycharm`, ...
    - bring Homebrew's management to standard macOS desktop apps
    - installs pre-compiled binaries, often from `.dmg` or `.pkg` files
    - Casks can include closed-source or commercial software
    - some Cask applications (like Chrome) may have their own internal auto-updaters, though Homebrew can also manage their versions
    - installs into the Caskroom (e.g., `/usr/local/Caskroom`) and moves apps to `/Applications`
    - install: `brew install --cask <PACKAGE-NAME>` 
    - uninstall: `brew uninstall --cask <PACKAGE-NAME>`

## Install Homebrew

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
```
- this usually installs `git`, `python3`, and other command-line tools that are essential for development

# Commands

    brew --version
    brew doctor
    brew --help

update brew

    brew update

upgrade outdated formulae and casks

    brew upgrade
    brew upgrade --cask

search

    brew search <PACKAGE-NAME>

list installed 

    brew list
    brew list --cask

view the installation prefix for Homebrew, which is the base directory where Homebrew installs its packages

    brew --prefix


# Managing Multiple Versions of a Package 

- Homebrew installs the latest version by default
  - but you can install older versions, though managing the active version is best handled by dedicated tools installed via Brew

- typically requires using versioned formulae 
  - e.g., `python@3.10`, `python@3.11`

- OR utilizing specialized version management tools
  - such as `Pyenv` for `Python` or `jEnv` for `Java`
  
`Linking`: 
- Homebrew allows installing multiple versions but only "links" one as the default
- You may need to use `brew unlink <PACKAGE>` and `brew link <PACKAGE>` to switch

## How to Manage Multiple Versions with Homebrew:

### Python: 
use **versioned formulae** to install specific releases,
  
    brew install python@3.10 
    brew install python@3.11

to switch easily, it is highly recommended to use `pyenv` 
  
    brew install pyenv


### Java (JDK): 

use `brew install --cask` to install multiple specific JDK versions 

    brew install --cask temurin@17
    brew install --cask temurin@21

For switching between them, tools like `jEnv` or `SDKMAN!` are standard solutions.
- `jEnv`: 
  - lightweight tool that manages Java versions but doesn't install them
  - you typically install Java via Homebrew and then "add" it to jEnv to enable automatic version switching
- `SDKMAN!`: 
  - excellent for the Java ecosystem
  - it can install `JDKs`, `Maven`, and `Gradle` effortlessly
  - however, it doesn't automatically switch versions when you enter a directory

#### Alternative (General): 
- For a unified approach across multiple languages, you can use `mise` (formerly `rtx`), which can be installed via Homebrew to manage Python, Java, Node.js, and more in one place. 

`Mise` 
- it is widely considered the best choice for new setups because it is written in Rust and eliminates the performance lag common in older managers
- Performance: 
  - up to 10x faster than `asdf`
  - modifies your PATH directly instead of using "shims" (wrapper scripts), which removes shell startup overhead
- Ease of Use: 
  - uses a single `.mise.toml` file to manage versions, environment variables, and tasks



