# Key management best practices

- Use a strong passphrase for secret keys
- Use an offline master key: 
  - keep master key offline/air-gapped
  - create subkeys for use on connected devices 
- Create and securely store a revocation certificate immediately after generating a key 
- Use subkeys: 
  - one for encryption (X25519)
  - one for signing (Ed25519)
  - optionally one for authentication (SSH)
- Set reasonable expirations and rotate keys or subkeys periodically 
- Prefer modern algorithms: 
  - Ed25519 (signing)
  - X25519 (encryption)
  - RSA 3072/4096 if needed for legacy compatibility
- Use hardware tokens (`YubiKey`, `Nitrokey`) for storing private keys if possible 
- Verify fingerprints OUT-OF-BAND (voice call, in person, secure messaging) before trusting a public key 
- Don’t upload your secret key anywhere
