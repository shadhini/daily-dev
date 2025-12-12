# OpenSSL Commands

## RSA Encryption / Decryption
Generate RSA private key

    openssl genpkey -algorithm RSA -out private_key.pem -pkeyopt rsa_keygen_bits:2048

Extract public key from private key

    openssl rsa -pubout -in private_key.pem -out public_key.pem

Encrypt the file

    openssl pkeyutl -encrypt -in test_file.txt -pubin -inkey public_key.pem -out test_file_encrypted.bin

Decrypt the File

    openssl pkeyutl -decrypt -in test_file_encrypted.bin -inkey private_key.pem -out test_file_decrypted.bin

Encrypt/Decrypt with timing

    time openssl pkeyutl -encrypt -in plaintext.txt -pubin -inkey public_key.pem -out encrypted_data.bin
    time openssl pkeyutl -decrypt -in encrypted_data.bin -inkey private_key.pem -out decrypted_data.txt


## AES Encryption / Decryption

Generate a 256-bit AES Encryption Key

    openssl rand -base64 32 > aes_key.txt

Encrypt the File

    openssl enc -aes-256-cbc -salt -in plaintext.txt -out encrypted_file.bin -pass file:aes_key.txt

Decrypt the File using the same AES key

    openssl enc -aes-256-cbc -d -in encrypted_file.bin -out decrypted_file.txt -pass file:aes_key.txt

### Recommended AES with `KDF`: Key Derivation Function

default KDF -> MD5-based key derivation (`EVP_BytesToKey`)
- weak  
- fast against brute-force

#### Recommended: PBKDF2 with iterations (stronger)
```shell
openssl enc -aes-128-cbc -salt -pbkdf2 -iter 100000 \
  -in plaintext.txt -out ciphertext1.enc \
  -pass file:aes_key.txt \
  -iv $(tr -d ' \n\r' < iv.txt)
  
# Decrypt with PBKDF2
openssl enc -aes-128-cbc -d -pbkdf2 -iter 100000 \
  -in ciphertext1.enc -out decrypted.txt \
  -pass file:aes_key.txt \
  -iv $(tr -d ' \n\r' < iv.txt)
```

#### Alternative: use raw key/iv in hex (no KDF)
```shell
openssl enc -aes-128-cbc -in plaintext.txt -out ciphertext_k.bin \
  -K 2f17120f046920b3a79d9ebff80093f6 -iv 2f17120f046920b3a79d9ebff80093f6
```

## Diffie-Hellman Key Exchange

Generate Diffie-Hellman Parameters

    openssl dhparam -out dhparam.pem 2048

Simulate two parties (Alice and Bob) by generating private keys and public keys for each party

    openssl genpkey -paramfile dhparam.pem -out alice_private.pem
    openssl pkey -in alice_private.pem -pubout -out alice_public.pem
    openssl genpkey -paramfile dhparam.pem -out bob_private.pem
    openssl pkey -in bob_private.pem -pubout -out bob_public.pem


Derive the shared secret on both sides and confirm they match
- Alice's side:

      openssl pkeyutl -derive -inkey alice_private.pem -peerkey bob_public.pem -out alice_shared_secret.bin

- Bob's side:

      openssl pkeyutl -derive -inkey bob_private.pem -peerkey alice_public.pem -out bob_shared_secret.bin


    diff alice_shared_secret.bin bob_shared_secret.bin

## PKI: Public Key Infrastructure

Create a Certificate Authority (CA)

- Generate the private key for the CA

      openssl genpkey -algorithm RSA -out ca.key -aes256 -pass pass:<CA_PRIVATE_KEY_FILE_PASSWORD>

- Generate the CA Certificate

      openssl req -new -x509 -key ca.key -sha256 -days 365 -out ca.crt -passin pass:<CA_PRIVATE_KEY_FILE_PASSWORD>

Generate a Private Key for the Server

    openssl genpkey -algorithm RSA -out server.key

Create a Certificate Signing Request (`CSR`) for the Server

    openssl req -new -key server.key -out server.csr

Sign the Server Certificate with the CA

    openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt -days 365 -sha256 -passin pass:<CA_PRIVATE_KEY_FILE_PASSWORD>

Verify the Server Certificate

    openssl verify -CAfile ca.crt server.crt

Simulate a Client-Server Authentication

- Start a simple server using the server key and certificate

      openssl s_server -cert server.crt -key server.key -accept 8443


- From another terminal, connect to the server as a client

      openssl s_client -connect localhost:8443 -CAfile ca.crt


### Set Up a Basic Certificate Authority (CA)

Create a directory structure for the CA, which includes directories for 
- CA's certificates
- private keys 
- database
```shell
mkdir -p ./demoCA/newcerts ./demoCA/private
touch ./demoCA/index.txt
touch ./demoCA/serial
printf '01\n' > ./demoCA/serial 
chmod 700 ./demoCA/private
chmod 755 ./demoCA/newcerts
```
- `./demoCA/private`: owner has full access; group and others cannot even `cd` into it
- `./demoCA/newcerts`: owner has full access; group/others can list, traverse and read filenames but cannot create/delete entries
- `./demoCA/serial`: file containing the starting serial number for certificates
    - ensure the file contains exactly one hex number and a trailing newline, nothing else

Generate a root private key for the CA
```shell
openssl genpkey -algorithm RSA -out ./demoCA/private/myCAkey.pem -pkeyopt rsa_keygen_bits:2048
```

Create the root certificate (self-signed) for the CA
```shell
openssl req -new -x509 -key ./demoCA/private/myCAkey.pem -out ./demoCA/myCAcert.pem -days 3650
```

- ensure that your CA root certificate (`myCAcert.pem`) is kept secure because it is the foundation of your trust chain


### Issue Certificate Using Your Own CA

Create a private key for `user1`
```shell
openssl genpkey -algorithm RSA -out user1_private_key.pem -pkeyopt rsa_keygen_bits:2048
```

Generate a CSR for `user1` using the private key
```shell
openssl req -new -key user1_private_key.pem -out user1_csr.pem
```

Use the root CA that you've created to issue a certificate for `user1`
```shell
openssl ca -config ./openssl.cnf -in user1_csr.pem -out user1_cert.pem -cert ./demoCA/myCAcert.pem -keyfile ./demoCA/private/myCAkey.pem -days 365
```

success output
```text
Using configuration from ./openssl.cnf
Check that the request matches the signature
Signature ok
Certificate Details:
        Serial Number: 1 (0x1)
        Validity
            Not Before: Dec  9 10:09:15 2025 GMT
            Not After : Dec  9 10:09:15 2026 GMT
        Subject:
            countryName               = US
            stateOrProvinceName       = Texas
            organizationName          = Tech Labs
            organizationalUnitName    = Engineering
            commonName                = techlabs.com
Certificate is to be certified until Dec  9 10:09:15 2026 GMT (365 days)
Sign the certificate? [y/n]:y


1 out of 1 certificate requests certified, commit? [y/n]y
Write out database with 1 new entries
Data Base Updated
```

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


# OpenSSL Command Format & Keywords

    openssl <utility> [options] [operands]


- `genpkey`: generate a private key
  - `-algorithm`: key generation algorithm
    - operands: `RSA`
  - `-out <NEW_PRIVATE_KEY_FILE_PATH>.pem`: name of the output file where generated private key is saved
  - `-pkeyopt`: private key options
    - operands: 
      - `rsa_keygen_bits:2048`: sets the RSA key size to 2048 bits 
  - `-aes256`: encrypts the private key with `AES-256` encryption
  - `-paramfile <PARAM_FILE_PATH>.pem`: specifies the parameter file; can be used to pass Diffie-Hellman parameters
  - `-pass pass:<YOUR_PASSWORD>`: used when encrypting the private key output file; specifies the password for encrypting the private key
- `rsa`: RSA utility
  - `-pubout`: extracts the public key from the given private key
  - `-in <PRIVATE_KEY_FILE_PATH>.pem`: input file containing the private key
  - `-out <NEW_PUBLIC_KEY_FILE_PATH>.pem`: output file where the extracted public key will be saved
- `pkeyutl`: public key operations (encryption, decryption, signing, verification)
  - `-encrypt`| `-decrypt` | `-derive`: encrypt/decrypt the input file | derive shared secret using private and peer public keys
  - `-in <INPUT_FILE_PATH>`: path to input file to be encrypted/decrypted
  - `-pubin`: indicates that the input key is a public key; if not present input key is taken as the private key
  - `-inkey <KEY_FILE_PATH>.pem`: key file  to be used for encryption/decryption/deriving shared secret
  - `-peerkey`: specifies the peer's public key file
  - `-out <OUTPUT_FILE_PATH>.bin`: output file where the encrypted/decrypted data/shared secret will be saved 
- `pkey`: manages private and public keys
  - `-in <INPUT_FILE_PATH>.pem`: specifies the input file; private key file
- `-pubout`: extracts the public key
- `-out <OUTPUT_FILE_PATH>.pem`: saves the output to a file; public key to a file
- `rand`: generate random data
  - `-base64 <NUMBER_OF_BYTES>`| `-hex <NUMBER_OF_BYTES>`  
    - `-base64`: encodes the output in Base64 format
    - `-hex`: encode the output in hexadecimal format
    - operand: `<NUMBER_OF_BYTES>`:  the key length (`32` -> 32 bytes = 256 bits)
  - `> <FILE_PATH>`: saves the output key to a file
- `enc`: performs encryption/decryption
  - `-aes-128-cbc` | `-aes-192-cbc` | `-aes-256-cbc`: specifies the encryption algorithm 
    - `-aes-128-cbc`: AES with a 128-bit key in CBC mode 
    - `-aes-192-cbc`: AES with a 192-bit key in CBC mode
    - `-aes-256-cbc`: AES with a 256-bit key in CBC mode
  - `-d`: specifies decryption | if this is not defined, then it specifies encryption
  - `-salt`: adds a salt to enhance security
  - `-in <PLAINTEXT_PATH>`: specifies the input file
  - `-out <ENCRYPTED_OUTPUT_FILE_PATH>.bin`: specifies the output file
  - `-iv <INITIALIZATION_VECTOR>`: can be any random key 
    - `$(tr -d ' \n\r' < iv.txt)`: can be used to import the key value from an existing file
  - `-pass file:aes_key.txt`: supplies the encryption key from `aes_key.txt`
- `dhparam`: generates Diffie-Hellman parameters
  - `-out <DH_PARM_FILE_PATH>.pem`: specifies the output file for the parameters
  - `2048` | `1024` | `4096` | ... : indicates the size of the DH parameters in bits
- `req`: creates/displays PKCS#10 certificate signing requests (CSRs)
  - `-new`: create a new CSR
  - `-x509`: output a self-signed certificate instead of a CSR
  - `-key <KEY_FILE.key>`: use existing private key
  - `-newkey rsa:2048`: generate a new private key as part of the command
  - `-sha256`: use SHA-256 as hashing algorithm
  - `-days 365`: sets the certificate’s validity period to `365` days
  - `-out <OUTPUT_FILE_PATH.crt>`: write CSR or cert to this file
  - `-keyout <PRIVATE_KEY_FILE[pem]>`: file path where the newly generated private key will be saved
  - `-passin pass:<YOUR_PASSWORD>`: to decrypt the encrypted private key input file
  - `-verify`: inspect and verify a CSR
  - `nodes`: short for “no DES”; do not encrypt the private key on disk; 
    - the generated private key file will be written in plaintext (no passphrase)
    - WARNING: this is insecure for production — anyone with file access can use the key
- `x509`: manipulate/inspect X.509 certificates
  - `-req`: treat input as CSR and output a certificate 
    - used with `-signkey` or `-CA/-CAkey`
  - `-in <INPUT_FILE[csr][pem][der]>`: specifies the input file; a certificate
  - `-CA <CA_CERTIFICATE[crt]> -CAkey <CA_PRIVATE_KEY[key]> -CAcreateserial`: sign a CSR with a CA cert/key and create a serial number file (`.srl`) for the certificate
  - `-out <OUTPUT_FILE[crt]>`: write the output file
  - `-days <n>`: certificate validity in days when creating a cert
  - `-sha256`: use SHA-256 as hashing algorithm
  - `-passin pass:<PRIVATE_KEY_PASSWORD>`: to decrypt the encrypted private key input file
  - `-text -noout`: print a certificate fil
- `verify [options] <CERTIFICATE_TO_BE_VERIFIED>`: checks an X.509 certificate’s chain of trust and validity against trusted CA certificates
  - verifies signatures, expiry, and optionally CRLs 
  - does not check hostnames
  - `-CAfile <CA_CERTIFIACTE[crt][pem]>`: use a file of trusted certificates (PEM bundle)
- `s_server`: built-in OpenSSL test/TLS server; listen on a TCP port and speak TLS
  - Can present a certificate/key, require client certificates, and print handshake/debug info
  - Can act as a simple HTTPS-like responder for GETs (-www)
  - `-cert <SERVER_CERTIFICATE_FILE[crt][pem]>`: server certificate (PEM)
  - `-key <SERVER_PRIVATE_KEY[key][pem]>`: server private key (PEM)
  - `-accept <PORT|HOST:PORT>`: port (or host:port) to listen on (e.g: 4433)
- `s_client`: OpenSSL’s built‑in TLS client; a flexible diagnostic tool to connect to TLS servers
  - opens a TLS connection to a host:port and prints handshake details and certificates
  - can request OCSP stapling, perform STARTTLS, present client certs, and exercise specific TLS versions/ciphers
  - not a full HTTP client: after the handshake you can type or pipe protocol data (HTTP/SMTP/etc)
  - `-connect <HOST>:<PORT>` : target to connect to (required)
  - `-CAfile <CA_CERTIFICATE[crt][pem]>` : trust anchors (PEM bundle) used to verify server certs
- `ca`: simple CA management command 
  - signs certificate signing requests (CSRs) to produce end‑entity or subordinate CA certificates using an on‑disk CA database 
  - maintains a certificate index (index.txt) and serial number file to track issued certificates 
  - can revoke certificates and generate CRLs 
  - uses the OpenSSL config (`ssl/openssl.cnf`) file to control policies, extensions, file locations, and defaults
  - `-config <CONFIG_FILE_PATH>` : specify the openssl config file to use, in case need to bypass the default config file
  - `-in <CSR_FILE[pem]>` : CSR to sign
  - `-out <CERT_FILE[pem]>` : destination certificate file
  - `-cert <CA_CERTIFICATE_FILE[pem]>`: CA certificate file to load and use as the signer identity instead of using the certificate file path taken from the config's CA_default
  - `-keyfile <CA_PRIVATE_KEY_FILE[pem]>`: private key file to use for signing operations
  - `-days <n>` : validity in days 
- `pkcs12`: create, parse, and convert PKCS#12 (PFX) files; PKCS#12 bundles keys + certificates into one binary file
  - commonly used by Windows, Java keystores, and some servers/clients
  - `-export`: create (export) a PKCS#12 file; without this flag, pkcs12 reads/inspects an existing `.pfx`
  - `-out <OUTPUT_FILE[pfx][p12]>`: path and filename to write the resulting PKCS#12 file
  - `-inkey <PRIVATE_KEY_FILE[pem]>`: private key file to include in the PKCS#12; 
    - this must correspond to the certificate given with `-in` (otherwise the bundle will be invalid for use)
  - `-in <CERTIFICATE[pem]>`: end‑entity (leaf) certificate to include in the PKCS#12
    - if the certificate and key match, that pair becomes the “personal” certificate entry in the PFX
  - `-certfile <CA_CHAIN[pem]>`: additional certificates to include in the PKCS#12 (usually intermediate CA certificates and optionally the root)

