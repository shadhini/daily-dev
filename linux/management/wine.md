# Wine

originally "Wine Is Not an Emulator"  

a compatibility layer that lets many Windows applications and games run on Unix-like systems (Linux, macOS, BSD) 
by reimplementing Windows APIs — not by emulating a full Windows OS


- Purpose: 
  - Wine translates Windows system calls and library/API calls into POSIX calls and native graphics/audio 
  calls so Windows binaries (.exe, .dll) can run on non‑Windows systems
- Not an emulator/VM: 
  - Wine is not a virtual machine and does not emulate CPU instructions (it runs native x86/x86_64 
      code directly on matching hardware)
  - That’s why performance can be close to native and why you don’t need a Windows license. 
  - It also means Wine can’t run Windows-only device drivers that expect kernel-level Windows interfaces.
- Use cases: 
  - run Windows desktop apps, many games, legacy business software, installers, and utilities on Linux/macOS without installing Windows

## `Winetricks`

a helper script/collection of small installation scripts for Wine 
that automates installing common Windows runtime components, fonts, DLLs and tweaks (things like corefonts, vcrun*, .NET, msxml, d3dx, gecko, registry fixes, and configuration tweaks)

```shell
winetricks -q corefonts vcrun6
```

## `wineprefix` (often simply “prefix”) 

a self-contained Wine environment 
- a directory that holds a fake Windows C: drive, registry, installed programs, and configuration
- Prefixes are used to isolate apps from each other (different settings, different Windows versions, different 
  installed libraries) so one broken install or library change doesn’t affect other apps

```shell
WINEPREFIX="$HOME/.wine32" wine RAS.exe
```

## Install Wine on Ubuntu:

```shell
# check system architecture
lscpu 
# Architecture:                x86_64
#  CPU op-mode(s):            32-bit, 64-bit
#  Address sizes:             39 bits physical, 48 bits virtual
#  Byte Order:                Little Endian

# update system repositories
sudo apt update && sudo apt upgrade

# install Wine
sudo apt install wine64
# sudo apt install wine32

# check Wine installation
wine --version

# if you need 32-bit support for 32-bit Windows apps, add i386 architecture and install wine32
sudo dpkg --add-architecture i386
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/noble/winehq-noble.sources
sudo apt update
sudo apt install --install-recommends wine32 wine64 winbind

sudo apt install mono-complete

wine --version
```


## wine commands

`wineboot` initializes and manages a Wine “Windows environment” (your WINEPREFIX)

```shell
WINEPREFIX="$HOME/.wine32" wineboot -u
```

## initialize wine environment

```shell
export WINEARCH=win32
# export WINEARCH=win64
export WINEPREFIX="$HOME/.wine32"
# export WINEPREFIX="$HOME/.wine64"
rm -rf "$WINEPREFIX"
wineboot --init
WINEPREFIX="$HOME/.wine32" winecfg
```

## run a Windows executable with Wine

```shell
WINEARCH=win32 WINEPREFIX="$HOME/.wine32" wine Downloads/HEC-RAS_66_Setup.exe
```

## install a .NET runtime into the prefix

```shell
WINEPREFIX="$HOME/.wine32" winetricks -q mono # lighter
WINEPREFIX="$HOME/.wine32" wine msiexec /i ~/Downloads/wine-mono-9.1.0-x86.msi

WINEPREFIX="$HOME/.wine32" winetricks -q dotnet48 
```



