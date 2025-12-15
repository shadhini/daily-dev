# Encryption / Decryption

## RSA 
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


## AES 

Generate a 256-bit AES Encryption Key

    openssl rand -base64 32 > aes_key.txt

Encrypt the File

    openssl enc -aes-256-cbc -salt -in plaintext.txt -out encrypted_file.bin -pass file:aes_key.txt

Decrypt the File using the same AES key

    openssl enc -aes-256-cbc -d -in encrypted_file.bin -out decrypted_file.txt -pass file:aes_key.txt

## Recommended AES with `KDF`: Key Derivation Function

default KDF -> MD5-based key derivation (`EVP_BytesToKey`)
- weak
- fast against brute-force

### Recommended: PBKDF2 with iterations (stronger)
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

### Alternative: use raw key/iv in hex (no KDF)
```shell
openssl enc -aes-128-cbc -in plaintext.txt -out ciphertext_k.bin \
  -K 2f17120f046920b3a79d9ebff80093f6 -iv 2f17120f046920b3a79d9ebff80093f6
```

