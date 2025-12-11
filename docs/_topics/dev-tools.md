---
title: Dev Tools
render_with_liquid: false
---

# Dev Tools

## IDEs
- Visual Studio Code
  - Visual Studio Code vs Visual Studio Code - Insiders
    - Visual Studio Code Stable: the monthly tested release for everyday work
    - Visual Studio Code Insiders: the daily preview build that gets new features first but may be less stable
- IntelliJ IDEA

## AI Tools
- GitHub Copilot 
  - [CLI](https://github.com/github/copilot-cli?utm_source=web-hpace-copilot-cli-primary-cta&utm_medium=web&utm_campaign=universe25post)
  - VS Code extension

## Build & Dependency Management Tools 
- Maven
- Gradle
  
## Cryptographic Tools for securing/signing files/documents/commits

- email, file, git signatures
    - `OpenPGP`: GnuPG (GPG) with GUIs -- `Kleopatra (Windows)`, `GPG Suite (macOS)`, `Seahorse (Linux)`, `Gpg4win`
- X.509 certificates / test signing
    - `OpenSSL`: create self-signed certs, create `.pfx`/`.p12`
- real trusted TLS certificates (websites)
    - `Let’s Encrypt` + `Certbot` (free, automated CA)
- sign code / git commits
    - `GPG` (git commit -S)
    - `SSH` commit signing (Git >=2.34)
    - GitHub accepts GPG/SSH public keys
- key/passphrase/encrypted backups storage & passphrase management
    - `Bitwarden` (free tier), `KeePass` (free, local)
    - OS keystores: `Windows Certificate Store`, `macOS Keychain`, `Linux secret stores`
- backup and offline storage
    - encrypted containers: `VeraCrypt`
    - encrypted PFX files made with OpenSSL
- device-backed keys:
    - use your platform authenticator (`WebAuthn`) — built-in and free;
    - hardware tokens cost money (not free)
- host public GPG keys for commit verification; accept signed commits/tags
    - Github
- passwordless logins
    - Platform authenticators
    - WebAuthn (built into browsers & OS)
- Key servers for distributing public OpenPGP keys
    - `hkp`
    - `SKS pools`; use modern keyservers or upload to GitHub instead

### How To

#### Create and maintain an OpenPGP key (free) — for signing emails/files/git

[security-tools/gpg/commands](https://github.com/shadhini/daily-dev/blob/main/security-tools/gpg/commands.md)

#### Create a self-signed X.509 cert and export to PFX - for testing PDF signing or internal use

[security-tools/openssl/commands](https://github.com/shadhini/daily-dev/blob/main/security-tools/openssl/commands.md)

#### Get trusted TLS certs for websites (`Let’s Encrypt`, free)

Install Certbot (certbot.eff.org) on your server

Run:

    sudo certbot --apache (or --nginx) 
- follow prompts to request and auto‑install certificates

Certbot will create certs and set up auto‑renewal (systemd timer / cron)

Maintain by testing renewal:

    sudo certbot renew --dry-run

#### Code signing / Git signing and GitHub

[git-commands/signing-commits](https://github.com/shadhini/daily-dev/blob/main/git-commands/signing-commits-and-git-configurations.md)

#### Use OS or free password manager to maintain passphrases and PFX backups

- `Bitwarden` or `KeePass` to store PFX passwords and recovery instructions securely
- keep one encrypted backup of any PFX or exported secret in an offline encrypted drive

