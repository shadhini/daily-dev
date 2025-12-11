---
title: Digital ID
render_with_liquid: false
---

# Digital ID

`Digital ID` can mean different things 
- an X.509 certificate/private key used to sign or authenticate
  - certificate/key-based digital ID
- a government eID
- a PII identity used for login
  - PII: personally identifiable information -- email, full name, NID, passport, phone number
- a cryptographic key for code signing
personal certificate, company PKI, government eID, GPG key, YubiKey/PIV

  
## Practical Tools & Recommendations

### Personal/consumer:
- `YubiKey` (`PIV: Personal Identity Verification` / `OpenPGP`) | `Nitrokey` 
  - for storing private keys and for WebAuthn/FIDO2(Fast IDentity Online 2)
- OS key store + password manager (`1Password`/`Bitwarden`) 
  - for storing PFX passphrases.
- Desktop: `Acrobat`/`Word` with a hardware token or imported `PFX` 
  - for signing

### Small org / devs:
- `GPG` 
  - for email/signing with a revocation certificate
  - store revocation cert offline
- a secure password manager 
  - for PFX passphrases  
  - store encrypted backups

### Enterprise:
- HSM appliances or cloud KMS (`Azure Key Vault` + Managed HSM, `AWS CloudHSM/KMS`, `Google Cloud KMS` + HSM)
    - for key custody
- Certificate lifecycle managers (`Venafi`, `DigiCert CertCentral`, `Sectigo`)
    - to automate issuance/rotation and discovery.

    