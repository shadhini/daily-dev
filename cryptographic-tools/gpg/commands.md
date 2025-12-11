# OpenPGP: GnuPG -- GPG Commands 

Install GnuPG
- Linux: package manager (apt/yum/pacman)

      sudo apt install gnupg
- Windows: Gpg4win (includes Kleopatra)
- macOS: GPG Suite


## Create and maintain an OpenPGP key (free) — for signing emails/files/git

Generate a new key (interactive)

    gpg --full-generate-key

- Recommended choices: RSA 3072/4096 or ECC (Ed25519 for signing, Curve25519/X25519 for encryption)
- choose expiration, set your name/email, choose a strong passphrase

Generate a new key: Noninteractive modern (Ed25519 primary + X25519 subkey via gpg 2.2+/2.3+)
    
    gpg --expert --full-generate-key

- choose ECC, ed25519 for signing and authentication, add an encryption subkey using Curve25519

Make a revocation certificate (very important)
    
    gpg --output revoke.asc --gen-revoke <KEYID>
- Store `revoke.asc` offline (USB or printed QR), not on the same system

Export public key (ASCII-armored)

   gpg --armor --export <KEYID> > my-public-key.asc

Backup/export your private key 

- rarely do this; keep offline

    gpg --export-secret-keys --armor <KEYID> > my-private-key.asc

- encrypt that file and store passphrase in a password manager or store it in an encrypted vault
  
      gpg -c my-private-key.asc
  - symmetric encryption (passphrase only)

Consider moving secret keys to a smartcard (`YubiKey`) with `gpg --card-edit`

Upload public key to places
 - publish to keyservers or add public key to GitHub (Settings → SSH and GPG keys)



Use it
- sign a file: 
     
      gpg --armor --sign file.txt

- sign git commits:

      git config user.signingkey <KEYID>; git commit -S -m "..."

- produces human-readable signed text; signed but readable

      gpg --clearsign message.txt

- detached signature

      gpg --detach-sign -o message.sig message.txt

- encrypt file to recipient(s): writes file.txt.gpg (binary)

      gpg --encrypt --recipient recipient@example.com file.txt

- encrypt file for ASCII armored output

      gpg --armor --encrypt --recipient recipient@example.com file.txt > file.txt.asc

- decrypt

      gpg --decrypt file.txt.gpg > file.txt

- encrypt and sign in one step
 
      gpg --encrypt --sign --recipient recipient@example.com file.txt


Rotate/expire
 - set an expiration date on keys and renew them periodically
 - revoke/replace if compromised

List keys:

    gpg --list-keys gpg --list-secret-keys

Edit key (add subkey, set expiry, revoke subkey)

    gpg --edit-key KEYID


## Delete GPG keys

Find the key and its fingerprint

- list secret keys 

      gpg --list-secret-keys --keyid-format LONG

- list public keys

      gpg --list-keys --keyid-format LONG

- use the fingerprint (the long hex string) or the long key ID (last 16 hex characters) when running commands

If the key was ever published or used externally — revoke it first (recommended)

- create a revocation certificate (do this BEFORE deleting a key you’ve published)

      gpg --output revoke.asc --gen-revoke <FINGERPRINT> 
      (Choose a reason and optionally add a short explanation)

- import the revocation locally

      gpg --import revoke.asc

- publish the revocation to keyservers (so others see it revoked)

      gpg --keyserver hkps://keyserver.ubuntu.com --send-keys <FINGERPRINT> 
  - Note: many keyservers are read-only or retention varies; 
    - publishing to multiple servers or uploading your public key with the revocation is wise

- if you used the key on GitHub, also remove the public key from GitHub

Delete the private key (local)

- Delete the secret key first: 

      gpg --delete-secret-keys <FINGERPRINT>

Delete the public key (local)

- After secret key removal, delete the public key: 

      gpg --delete-keys <FINGERPRINT>

Verify deletion

- Update trustdb

      gpg --update-trustdb

- Confirm no secret key remains: 

      gpg --list-secret-keys --keyid-format LONG

- Confirm public key removed: 

      gpg --list-keys --keyid-format LONG

Remove published copies from services, git & backups
 - GitHub: Settings → SSH and GPG keys → remove the GPG public key you added 
   - Git commits signed by this key remain in history
   - If you published a revocation, platforms like GitHub may mark signatures as `"No longer verified"` after the revocation propagates

 - Remove any exported backups (`.asc`, `.gpg`, `.pfx`) and their passwords from cloud or password managers if you want permanent removal

If the key was on a hardware token (`YubiKey` / `smartcard`)
- YubiKey OpenPGP: Requires YubiKey Manager
  - use `ykman` to reset (this wipes the token) - use carefully — this cannot be undone
  
        ykman openpgp reset
- OR use `gpg --card-edit` for some operations
         
GUI tools
- Kleopatra (Gpg4win, Windows)
  - Open Kleopatra → right‑click the key → "Delete Certificate" (delete secret first if prompted)
- GPG Keychain (GPG Suite, macOS)
  - Select key → Key → Delete Secret Key / Delete Public Key 
- Seahorse (GNOME, Linux)
  - Right‑click key → Delete

  
If you want to fully remove traces from your GnuPG directory (advanced, optional)
- GnuPG stores private keys and keyrings under `~/.gnupg`
- After deleting keys with gpg commands, you usually do not need to manually remove files
- Manual deletion is risky; only do it if you know what you’re removing 
  - get keygrip(s) for the secret key
        
        gpg --with-keygrip --list-secret-keys FINGERPRINT
  - remove the corresponding files (VERY careful)
  
        rm -f ~/.gnupg/private-keys-v1.d/<KEYGRIP>.key
  -restart agent

        gpgconf --kill gpg-agent gpgconf --launch gpg-agent

- Do NOT delete `~/.gnupg` unless you mean to wipe all GPG state (destructive) - destroys everything

        rm -rf ~/.gnupg


## Other

Verify a signature: for clearsigned or signed file

    gpg --verify message.sig message.txt gpg --verify file.txt.asc 

Import someone’s public key

    gpg --import pubkey.asc

Fetch key from keyserver (less recommended; prefer WKD or direct exchange): 

    gpg --keyserver hkps://keys.openpgp.org --recv-keys KEYID 
 - Note: keys.openpgp.org respects email verification and strips user IDs not validated


