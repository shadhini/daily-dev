# Digitall ID Best practices (individuals and small teams)

1. Prefer hardware-backed keys when possible
    - Use a hardware token or smartcard (YubiKey, Nitrokey, smartcard/PIV) to store the private key
    - The private key never leaves the device
    - For mobile use, consider hardware tokens that support NFC(Near Field Communication) or platform integration
2. Use strong algorithms and key lengths
    - RSA ≥2048 bits (prefer 3072), ECC (P-256, P-384) with SHA‑256/SHA‑384 for signatures
    - Let the CA and tools default to modern algorithms
3. Protect access with MFA and PINs
    - Require a PIN for the token and a second factor for the account that manages certificates (email/MFA)
    - For software keystores, use a strong passphrase and store it only in a secure password manager
4. Keep a secure, encrypted backup
    - Export certificates/keys to an encrypted container (`PKCS#12` / `.pfx`) protected by a strong passphrase;
        - store encrypted backup copies in two separate secure locations (e.g., an encrypted offline drive and an encrypted cloud vault)
    - Consider key escrow for important org certificates (store in an HSM or secure escrow with strict governance)
5. Use HSMs(Hardware Security Modules) or cloud key management for high value/org use
    - For enterprise or high-value signing, use FIPS-certified HSMs or cloud KMS
        - AWS KMS, Azure Key Vault, Google Cloud KMS
        - so private keys never leave the module and operations are auditable
6. Enforce least privilege and dedicated keys
    - Use separate keys for different purposes (email signing, code signing, TLS, client auth)
    - Don’t reuse a signing key for unrelated services
7. Monitor, audit, and record usage
    - Enable logs and alerts for certificate issuance, signing events, and admin actions
    - Keep audit trails for legal or compliance needs
8. Plan lifecycle: rotation, renewal, revocation
    - Set reminders well before expiry (60–90 days for important certs)
    - Rotate keys regularly (annual or per policy) and immediately revoke if compromised
    - Publish revocation (CRL/OCSP) or use OCSP stapling where relevant
9. Secure key disposal
    - When retiring a key, securely erase it from devices and update revocation lists so others can detect it as invalid
10. Protect the environment
- keep devices up to date
- run antivirus/endpoint protection on machines that access keys
- avoid using keys on untrusted devices
