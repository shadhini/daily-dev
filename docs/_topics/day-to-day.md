---
title: Day-to-Day
render_with_liquid: false
---

# Digital tools and workflows for everyday life

## Signing Documents

### Simple electronic signature: sign PDFs/documents (visual)
`easy, fast, widely accepted for routine docs`

- A drawn/typed/stamped signature image or “Fill & Sign” placement in a PDF or Word file.

Pros: 
- very easy
- no special keys or certificates

Cons: 
- lower cryptographic assurance — easier to spoof or dispute for high‑value transactions

Tools:
- Adobe Reader (Fill & Sign)
- Microsoft Word (Draw or Signature Line)
- free web tools (Smallpdf, PDFescape, HelloSign free tier)
- mobile apps (Adobe Fill & Sign)


### Cryptographic (certificate‑based) digital signature 

`strong, verifiable`

- Uses a private key + certificate (PKI).
- The signature is embedded and can be cryptographically validated and timestamped.

Pros: 
- cryptographically provable
- tamper‑evident
- often preferred/required for legal/regulated transactions

Cons: 
- more setup (you need a digital ID / certificate or use a provider’s cloud signing service)


Tools:
- you can use a self‑signed cert for internal use or a CA cert for external trust
- Adobe Acrobat (Certificates tool)
- LibreOffice
- Microsoft Office digital signatures
- dedicated e‑signature providers that offer certificate signatures
  - DocuSign with ID verification
  - GlobalSign
  - Entrust
- hardware tokens or smartcards


### What to pick

- If this is internal paperwork or low‑risk forms: 
  - use Fill & Sign in Adobe Reader or a web e‑signature provider
- If this is a legal contract, real estate closing, notarization, or regulated filing: 
  - use a certificate‑based digital signature or a trusted e‑signature service that offers identity verification and audit trails

### Security & legal tips

- Keep your private key private. If using a token/smartcard, keep it secure. 
- Use reputable providers or CAs for high‑value documents. 
- Use timestamping so the signature remains valid even after the signer’s certificate expires. 
- Check local laws: ESIGN/UETA (USA), eIDAS (EU), and country eID/qualified signatures have different legal weights. 
- For notarization or court‑grade signatures, confirm with the counterparty or attorney which signature type is required.


### How To

#### Fast & free — sign a PDF with Adobe Acrobat Reader (Fill & Sign) or in Microsoft Word document
Good for: forms, approvals, casual contracts.
- Adobe Acrobat Reader (free) 
  - “Fill & Sign” → Choose “Sign” → “Add Signature” (type, draw, or upload an image)
- Microsoft Word document 
  - Insert → Signature Line (for visual signature line)

#### Legally stronger — sign PDF with Adobe Acrobat using a Digital ID (certificate)
- Obtain 
  - a digital ID: From a certificate authority (CA) or 
  - use a hardware token / smartcard, or 
  - create a self‑signed one (less trustworthy) or 
  - use a cloud signing provider that gives you a verified certificate

- Adobe Acrobat (Pro or Reader with Certificates enabled):
  - Tools → Certificates → Digitally Sign 
  - Draw the signing rectangle, pick your Digital ID, add reason and timestamp, and sign
  - Recipients can validate signature details and certificate chain 
  - For long‑term validation, request a trusted timestamp from a TSA (timestamp authority) or enable LTV.

- Microsoft Word document — add a cryptographic signature 
  - File → Info → Protect Document → Add a Digital Signature 
  - Word will prompt to choose a certificate/Digital ID
  - Follow prompts and sign. 
  - Recipients can verify the signature in Word/Office.

- Use a hosted e‑signature provider (DocuSign, Adobe Sign, HelloSign)
  - Create account, upload document, add signer fields, send to signers. 
  - The service handles identity verification, audit trail, and (optionally) certificate‑based signatures. 
  - Best for workflows, multiple signers, and when you want an audit trail and easy distribution.


#### With OpenPGP 
- OpenPGP (gpg) signatures are not recognized by PDF viewers as an embedded "digital signature"
- You can (recommended/common) create an OpenPGP detached signature for the PDF (or sign/encrypt the PDF as an OpenPGP object)
- That lets anyone with your public key cryptographically verify the PDF’s integrity and origin, but they must verify with GPG (or extract the signature) — PDF viewers will not show it as a “signed PDF”

## Formatting Flash Drives

@Windows OS:
Windows Icon ➔ Disk Management
- Check drive letter, capacity & removability to identify the flash drive
- Delete small volumes (if any) to get unallocated space
- Right-click unallocated space → New Simple Volume → Format with FAT32 (for drives ≤32GB) or exFAT (for larger drives)
- Then reformat the particular drive letter in File Explorer 


