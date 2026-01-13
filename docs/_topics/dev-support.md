---
title: Dev Support
render_with_liquid: false
---

# Developer Support

## Software Licensing

[software-licenses](https://shadhini.github.io/daily-dev/topics/software-licenses)

## How To's

### Create and maintain an OpenPGP key (free) — for signing emails/files/git

[cryptographic-tools/gpg/commands](https://github.com/shadhini/daily-dev/blob/main/cryptographic-tools/gpg/commands.md#create-and-maintain-an-openpgp-key-free--for-signing-emailsfilesgit)

### Create a self-signed X.509 cert and export to PFX - for testing PDF signing or internal use

[cryptographic-tools/openssl/commands](https://github.com/shadhini/daily-dev/blob/main/cryptographic-tools/openssl/openssl-commands/commands.md#create-a-self-signed-x509-cert-and-export-to-pfx---for-testing-pdf-signing-or-internal-use)

### Get trusted TLS certs for websites (`Let’s Encrypt`, free)

Install Certbot (certbot.eff.org) on your server

Run:

    sudo certbot --apache (or --nginx) 
- follow prompts to request and auto‑install certificates

Certbot will create certs and set up auto‑renewal (systemd timer / cron)

Maintain by testing renewal:

    sudo certbot renew --dry-run

### Code signing / Git signing and GitHub

[git-commands/signing-commits](https://github.com/shadhini/daily-dev/blob/main/git-commands/signing-commits-and-git-configurations.md)

### Use OS or free password manager to maintain passphrases and PFX backups

- `Bitwarden` or `KeePass` to store PFX passwords and recovery instructions securely
- keep one encrypted backup of any PFX or exported secret in an offline encrypted drive
