# Signing Commits and Git Configurations

---

	git --version

---

#### Git Credentials Helper

- macOS Keychain (older versions of Git)
  - built‑in option for macOS users that securely stores credentials in the system keychain
  - simple and reliable for basic HTTPS auth

		git credential-osxkeychain: 
  
- Git Credential Manager (recommended for modern setups)
  - the modern, cross‑platform, actively maintained helper that handles PATs, multi‑factor flows, and token refresh

		brew install --cask git-credential-manager 
		git config --global credential.helper manager-core

---

	git config --show-origin --get-all credential.helper 
	git config --global --get-all credential.helper


---

    git config user.name "Your Name"
    git config user.email "your.email@example.com"
    git config --global user.name "Your Name"
    git config --global user.email "your.email@example.com"
	git config --global color.ui auto

---

	git config user.name
	git config user.email
	git config --global user.name
	git config --global user.email
	git config --get user.signingkey
	git config --get commit.gpgSign

---

Generate gpg key for signing commits

	gpg --expert --full-generate-key
- choose ECC, ed25519 for signing and authentication, add an encryption subkey using Curve25519

Make a revocation certificate (very important)
    
    gpg --output revoke.asc --gen-revoke <KEYID>
- Store `revoke.asc` offline (USB or printed QR), not on the same system

Export public key (ASCII-armored)

	gpg --armor --export <KEYID> > git-public-key.asc

Then,

	gpg --list-keys --keyid-format LONG
	gpg --list-secret-keys --keyid-format LONG
	gpgconf --kill gpg-agent
	gpgconf --launch gpg-agent

---

Use a GPG key and add the public key to GitHub
- Profile → Settings → SSH and GPG keys -> New GPG key

Configure Git to sign

    git config --global user.signingkey <YOUR_KEY_ID>
    git config --global commit.gpgsign true

	git config user.signingkey ABC123DEF
	git config commit.gpgSign true

---

	git commit -S -m "Your commit message"
	git tag -s v1.0 -m "Version 1.0"
	git log --show-signature

---

Verify commits on GitHub appear as `"Verified"`

