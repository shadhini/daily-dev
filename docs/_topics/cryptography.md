---
title: Cryptography
render_with_liquid: false
---

# Cryptography

`art and science of securing information by converting it into an unreadable format for unauthorized users`

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

## `OpenSSL` vs `LibreSSL:
* `OpenSSL`: already available on Ubuntu Linux distribution
* `LibreSSL`: already available on macOS


| Feature                       | OpenSSL                                                                                                  | LibreSSL                                                                                         |
|-------------------------------|----------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------|
| **Origin**                    | Established in 1998                                                                                      | Forked from OpenSSL in 2014 by OpenBSD                                                           |
| **Development Philosophy**    | Extensive feature set and broad compatibility                                                            | Focus on code quality, security, and simplicity                                                  |
| **Maintenance**               | Maintained by the OpenSSL Project                                                                        | Maintained by the OpenBSD Project                                                                |
| **Codebase Quality**          | Larger and more complex codebase                                                                         | Cleaner codebase with many legacy parts removed                                                  |
| **Security Focus**            | Regular updates and broad support                                                                        | Strong emphasis on security best practices                                                       |
| **Compatibility**             | Broad compatibility with many systems and applications                                                   | May lack some legacy features; focused on modern security practices                              |
| **Use Cases**                 | Widely used in web servers, embedded systems, and applications                                           | Used in security-focused environments like OpenBSD                                               |
| **Documentation and Support** | Extensive documentation and community support                                                            | Strong community support, especially within OpenBSD                                              |
| **OS Support**                | Cross-platform, supports most major operating systems including Windows, Linux, macOS, and Unix variants | Primarily developed for OpenBSD; also supports other Unix-like systems including Linux and macOS |

