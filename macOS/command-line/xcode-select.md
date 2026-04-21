# Xcode Select 

`command-line utility used to manage the active developer directory for Apple's development tools`
- it essentially tells your system which version of Xcode (or the standalone Command Line Tools) to use when you run commands like `git`, `gcc`, or `make`

```bash
# when xcode command line tools are not installed, you may see the following error when running `python3 --version` or other commands that require developer tools:
s@Ss-MacBook-Pro % python --version
zsh: command not found: python

s@Ss-MacBook-Pro % python3 --version
xcode-select: note: No developer tools were found, requesting install.
If developer tools are located at a non-default location on disk, use `sudo xcode-select --switch path/to/Xcode.app` to specify the Xcode that you wish to use for command line developer tools, and cancel the installation dialog.
See `man xcode-select` for more details.

```

## Why You Need It
Most users encounter this command when setting up `Homebrew`, as `Homebrew` relies on the Unix-based utilities provided by the Command Line Tools. 

If you only need to run terminal commands and don't plan on building iOS apps, the `xcode-select --install` package is sufficient and saves significant disk space compared to the full `Xcode app`.

## Commands

install the command-line tools

    xcode-select --install

- triggers a popup to download and install the `Command Line Tools (CLT)` package
- this is a smaller (~800MB) alternative to the full `Xcode IDE` (~12GB+) and is required for `Homebrew`

verify installation: path of the active developer directory

    xcode-select -p

switch between Xcode versions

    sudo xcode-select -s /path/to/Xcode.app 

- set the active developer directory to a specific version of Xcode

resets the tool path to the default location

    sudo xcode-select --reset
    # OR
    sudo xcode-select -r

- can fix errors after a macOS update
