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

[cryptography](https://shadhini.github.io/daily-dev/topics/cryptography/)

## Steganography Tools

[steganography](https://shadhini.github.io/daily-dev/topics/steganography/)


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

