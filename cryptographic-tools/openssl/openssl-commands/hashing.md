# Hashing

## Hash a String
- `MD5` Hash:

      echo -n Hello, OpenSSL! | openssl dgst -md5

- `SHA-256` Hash:

  echo -n Hello, OpenSSL! | openssl dgst -sha256


## Hash a File


    openssl dgst -md5 testfile.txt
    openssl dgst -sha256 testfile.txt
    openssl dgst -sha1 testfile.txt
    openssl dgst -sha512 testfile.txt

## Generate `HMAC`: Hash-Based Message Authentication Code

---
`HMAC`: checksum/integrity + authenticity for a message

---

Create a secret key

    echo "supersecretkey" > secret.key

Generate HMAC

    openssl dgst -sha256 -hmac "supersecretkey" testfile.txt

