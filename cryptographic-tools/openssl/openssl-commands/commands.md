# OpenSSL Commands

Install

- Linux:

        sudo apt update
        sudo apt install openssl

 
    openssl version

## Create a self-signed X.509 cert and export to PFX - for testing PDF signing or internal use

Generate private key + certificate

    openssl req -x509 -nodes -days 3650 -newkey rsa:3072 -keyout key.pem -out cert.pem

Create a PFX (PKCS#12) package to import into OS key store:

    openssl pkcs12 -export -out myid.pfx -inkey key.pem -in cert.pem -certfile cert.pem
- choose a strong export password and store it in a password manager

Import into 
- Windows: double-click myid.pfx → Certificate Import Wizard → place in Personal store
- macOS: Keychain Access → File → Import Items → choose myid.pfx and supply password

Use to sign PDFs
- LibreOffice: File → Digital Signatures → Sign Document (choose the certificate from system store) then Export as PDF (signed)
- Acrobat/Reader may let you use the cert too, though recipients will see the cert is self‑signed


## Supporting commands

to measure the duration of the encryption/decryption process

    time openssl <utility> [options] [operands]

to confirm that 2 files are identical

    sha256sum <FILE_1> <FILE_2>

compare differences

    diff <FILE_1> <FILE_2>


