### Signing Commits and Git Configurations

---

    git config user.name "Your Name"
    git config user.email "your.email@example.com"
    git config --global user.name "Your Name"
    git config --global user.email "your.email@example.com"

---

	git config user.name
	git config user.email
	git config --global user.name
	git config --global user.email
	git config --get user.signingkey
	git config --get commit.gpgSign

---

	gpg --full-generate-key
	gpg --list-secret-keys --keyid-format LONG
	gpg --armor --export <YOUR_KEY_ID>
	gpgconf --kill gpg-agent
	gpgconf --launch gpg-agent

---

	git config --global user.signingkey <YOUR_KEY_ID>
	git config --global commit.gpgSign true
	git config user.signingkey ABC123DEF
	git config commit.gpgSign true

---

	git commit -S -m "Your commit message"
	git tag -s v1.0 -m "Version 1.0"
	git log --show-signature

---
