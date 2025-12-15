# PKI: Public Key Infrastructure

## Set up a CA: Certificate Authority 

### Create a directory structure for the CA  
directories for
- CA's certificates
- private keys
- database

```shell
mkdir -p ca/{certs,crl,newcerts,private}
touch ca/index.txt
echo 1000 > ca/serial
echo 1000 > ca/crlnumber
chmod 700 ca/private
chmod 755 ca/newcerts
chmod 644 ca/index.txt ca/serial ca/crlnumber
```
- `ca/private`: owner has full access; group and others cannot even `cd` into it
- `ca/newcerts`: owner has full access; group/others can list, traverse and read filenames but cannot create/delete entries
- `ca/serial`: file containing the starting serial number for certificates
    - ensure the file contains exactly one hex number and a trailing newline, nothing else
- `ca/crlnumber`: required by OpenSSL to track CRL versions
    - ensure file exists; create and initialize it manually if it doesn't already exist
    - can be initialized to any number
    - OpenSSL will increment it for each new CRL generated
- `index.txt`, `serial`, `crlnumber` files should be readable and writable by user
- make sure `index.txt`, `serial`, `crlnumber`, `private`, `newcerts`  directives are correctly configured in the `openssl.cnf` file

### Create the OpenSSL configuration file
`ca/openssl.cnf`

```shell
nano ca/openssl.cnf
```

- Content of openssl.cnf:
```text
[ ca ]
default_ca = CA_default

[ CA_default ]
dir               = ./ca
certs             = $dir/certs
database          = $dir/index.txt
new_certs_dir     = $dir/newcerts
serial            = $dir/serial
private_key       = $dir/private/ca-key.pem
certificate       = $dir/certs/ca-cert.pem
crlnumber         = $dir/crlnumber
crl               = $dir/crl/ca-crl.pem
crl_dir           = $dir/crl
default_md        = sha256
name_opt          = ca_default
cert_opt          = ca_default
default_days      = 375
preserve          = no
policy            = policy_anything
unique_subject    = yes
default_crl_days  = 30
crl_extensions    = crl_ext
    
[ policy_strict ]
# require some fields; set "optional" or "match" as needed
countryName             = match
stateOrProvinceName     = match
organizationName        = match
organizationalUnitName  = optional
commonName              = supplied
emailAddress            = optional

[ policy_anything ]
countryName             = optional
stateOrProvinceName     = optional
organizationName        = optional
organizationalUnitName  = optional
commonName              = supplied
emailAddress            = optional

[ req ]
default_bits        = 2048
prompt              = no
default_md          = sha256
distinguished_name  = req_distinguished_name
req_extensions      = req_ext

[ req_distinguished_name ]
C  = US
ST = California
L  = San Francisco
O  = Example Org
OU = IT
CN = example.com

[ req_ext ]
subjectAltName = @alt_names

[ v3_ca ]
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid:always,issuer
basicConstraints = critical, CA:true
keyUsage = critical, digitalSignature, cRLSign, keyCertSign

[ v3_intermediate_ca ]
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid:always,issuer
basicConstraints = critical, CA:true, pathlen:0
keyUsage = critical, digitalSignature, cRLSign, keyCertSign

[ usr_cert ]
basicConstraints = CA:FALSE
nsCertType = client, email
nsComment = "OpenSSL Generated Client Certificate"
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid,issuer
keyUsage = critical, nonRepudiation, digitalSignature, keyEncipherment
extendedKeyUsage = clientAuth, emailProtection

[ server_cert ]
basicConstraints = CA:FALSE
nsCertType = server
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid,issuer
keyUsage = critical, digitalSignature, keyEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names

[ crl_ext ]
authorityKeyIdentifier=keyid:always
    
[ alt_names ]
DNS.1 = example.com
DNS.2 = www.example.com
```


### Generate a root private key for the CA
- ensure that your CA root certificate is kept secure because it is the foundation of your trust chain

```shell
openssl genrsa -aes256 -out ca/private/ca-key.pem 2048
```
OR
```shell
openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -out ca/private/ca-key.pem -aes256 
```


### Generate the CA Certificate
Create the root certificate (self-signed) for the CA

```shell
openssl req -new -x509 -key ca/private/ca-key.pem -sha256 -days 3650 -out ca/certs/ca-cert.pem -subj "/CN=MyTestCA"
```


## Issue Certificate Using Your Own CA

### Create private key for user/client

Create a private key for `user1`
```shell
openssl genpkey -algorithm RSA -out user1_private_key.pem -pkeyopt rsa_keygen_bits:2048
```
Generate the client's private key
```shell
openssl genrsa -out client.key 2048
```

### Generate CSR for user/client
Generate a Certificate Signing Request (CSR) for `user1` using the private key
```shell
openssl req -new -key user1_private_key.pem -out user1_csr.pem
```
Generate the CSR for client

```shell
openssl req -new -key client.key -out client.csr -subj "/CN=ClientCertificate"
```

### Sign CSR with the CA / Issue CA signed certificate
use the root CA that you've created to issue a certificate for `user1`; sign the certificate for client

#### OPTION 1
```shell
openssl ca -config ca/openssl.cnf -in user1_csr.pem -out user1_cert.pem -cert ca/certs/ca-cert.pem -keyfile ca/private/ca-key.pem -days 365
```
- `-keyfile ca/private/ca-key.pem`: explicitly specify the CA private key to sign with

success output
```text
Using configuration from ca/openssl.cnf
Enter pass phrase for ca/private/ca-key.pem:
Check that the request matches the signature
Signature ok
Certificate Details:
        Serial Number: 4096 (0x1000)
        Validity
            Not Before: Dec 15 16:23:41 2025 GMT
            Not After : Dec 15 16:23:41 2026 GMT
        Subject:
            countryName               = LK
            stateOrProvinceName       = Western
            organizationName          = TechLabs
            organizationalUnitName    = Engineering
            commonName                = techlabs.com
Certificate is to be certified until Dec 15 16:23:41 2026 GMT (365 days)
Sign the certificate? [y/n]:y


1 out of 1 certificate requests certified, commit? [y/n]y
Write out database with 1 new entries
Data Base Updated
```

#### OPTION 2

```shell
openssl ca -config ca/openssl.cnf -in client.csr -out client.crt -batch
```
- sign with the CA’s private key that is configured according to given openssl configuration file

success output
```text
Using configuration from ca/openssl.cnf
Enter pass phrase for ./ca/private/ca-key.pem:
Check that the request matches the signature
Signature ok
Certificate Details:
        Serial Number: 4097 (0x1001)
        Validity
            Not Before: Dec 15 16:31:57 2025 GMT
            Not After : Dec 25 16:31:57 2026 GMT
        Subject:
            commonName                = ClientCertificate
Certificate is to be certified until Dec 25 16:31:57 2026 GMT (375 days)

Write out database with 1 new entries
Data Base Updated
```

#### OPTION 3
```shell
openssl x509 -req -in server.csr -CA ca/certs/ca-cert.pem -CAkey ca/private/ca-key.pem -CAcreateserial -out server.crt -days 365 -sha256 
```


## Generate a Self-Signed Certificate

```shell
openssl x509 -req -in user1_csr.pem -signkey user1_private_key.pem -out user1_cert_self_signed.pem -days 365
```

- `-signkey user1_private_key.pem`: uses the user's private key to sign the certificate

success output
```text
Signature ok
subject=C = LK, ST = Western, L = Colombo, O = TechLabs, OU = Engineering, CN = techlabs.com
Getting Private key
```

## Verify the CA issued/signed certificates

```shell
openssl x509 -in user1_cert.pem -text -noout
openssl x509 -in client.crt -text -noout
```

OUTPUT
```text
Certificate:
    Data:
        Version: 1 (0x0)
        Serial Number: 4096 (0x1000)
        Signature Algorithm: sha256WithRSAEncryption
        Issuer: CN = MyTestCA
        Validity
            Not Before: Dec 15 16:23:41 2025 GMT
            Not After : Dec 15 16:23:41 2026 GMT
        Subject: C = LK, ST = Western, O = TechLabs, OU = Engineering, CN = techlabs.com
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                RSA Public-Key: (2048 bit)
                Modulus: .....
                Exponent: 65537 (0x10001)
    Signature Algorithm: sha256WithRSAEncryption  .....
```
```text
Certificate:
    Data:
        Version: 1 (0x0)
        Serial Number: 4097 (0x1001)
        Signature Algorithm: sha256WithRSAEncryption
        Issuer: CN = MyTestCA
        Validity
            Not Before: Dec 15 16:31:57 2025 GMT
            Not After : Dec 25 16:31:57 2026 GMT
        Subject: CN = ClientCertificate
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                RSA Public-Key: (2048 bit)
                Modulus: .....
                Exponent: 65537 (0x10001)
    Signature Algorithm: sha256WithRSAEncryption  .....
```

```shell
openssl verify -CAfile ca/certs/ca-cert.pem user1_cert.pem 
openssl verify -CAfile ca/certs/ca-cert.pem client.crt
```

OUTPUT
```shell
❯ 
user1_cert.pem: OK
❯ 
client.crt: OK
```


## Verify self-signed certificates

```shell
openssl x509 -in user1_cert_self_signed.pem -text -noout
```
- not meaningful for self-signed certificates

OUTPUT
```text
Certificate:
    Data:
        Version: 1 (0x0)
        Serial Number:
            2a:26:ae:13:4b:6e:94:9f:b5:d8:df:16:b2:ee:5e:d5:93:ce:d2:06
        Signature Algorithm: sha256WithRSAEncryption
        Issuer: C = LK, ST = Western, L = Colombo, O = TechLabs, OU = Engineering, CN = techlabs.com
        Validity
            Not Before: Dec 15 16:45:45 2025 GMT
            Not After : Dec 15 16:45:45 2026 GMT
        Subject: C = LK, ST = Western, L = Colombo, O = TechLabs, OU = Engineering, CN = techlabs.com
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                RSA Public-Key: (2048 bit)
                Modulus:  .....
                Exponent: 65537 (0x10001)
    Signature Algorithm: sha256WithRSAEncryption .....
```
----

```shell
openssl verify -CAfile user1_cert_self_signed.pem user1_cert_self_signed.pem
```

- `-CAfile user1_cert_self_signed.pem`: specifies the certificate as its own CA (self-signed)

OUTPUT
```text
user1_cert_self_signed.pem: OK
```

## Export the Certificate in Different Formats

Convert to DER format

    openssl x509 -in certificate.crt -outform DER -out certificate.der

Convert to PKCS#12 format: combine the private key and certificate into a PKCS#12 bundle

    openssl pkcs12 -export -inkey private_key.pem -in certificate.crt -out certificate.p12


## Certificate Revocation Using a Certificate Revocation List (CRL)

Revoke the client certificate

```shell
openssl ca -config ca/openssl.cnf -revoke client.crt
```

- OUTPUT

      Using configuration from ca/openssl.cnf
      Enter pass phrase for ./ca/private/ca-key.pem:
      Revoking Certificate 1001.
      Data Base Updated

Generate the CRL file

```shell
openssl ca -config ca/openssl.cnf -gencrl -out ca/crl/ca-crl.pem
```

Verify the revoked certificate against the CRL

```shell
openssl verify -crl_check -CAfile ca/certs/ca-cert.pem -CRLfile ca/crl/ca-crl.pem client.crt
```

- OUTPUT

      CN = ClientCertificate
      error 23 at 0 depth lookup: certificate revoked
      error client.crt: verification failed

Verify the non-revoked certificate against the CRL

```shell
openssl verify -crl_check -CAfile ca/certs/ca-cert.pem -CRLfile ca/crl/ca-crl.pem user1_cert.pem
```

- OUTPUT

        user1_cert.pem: OK

Inspect the CRL

```shell
openssl crl -in ca/crl/ca-crl.pem -text -noout
```

- OUTPUT

        Certificate Revocation List (CRL):
        Version 2 (0x1)
        Signature Algorithm: sha256WithRSAEncryption
        Issuer: CN = MyTestCA
        Last Update: Dec 15 17:35:17 2025 GMT
        Next Update: Jan 14 17:35:17 2026 GMT
        CRL extensions:
        X509v3 Authority Key Identifier:
        keyid:52:C6:3D:00:C4:71:B1:76:E4:EA:52:5C:09:78:C8:37:0E:D1:14:9F
        
                    X509v3 CRL Number: 
                        4096
        Revoked Certificates:
        Serial Number: 1001
        Revocation Date: Dec 15 17:34:13 2025 GMT
        Signature Algorithm: sha256WithRSAEncryption .....



## Simulate a Client-Server Authentication

Generate a Private Key for the Server

    openssl genpkey -algorithm RSA -out server.key

Create a Certificate Signing Request (`CSR`) for the Server

    openssl req -new -key server.key -out server.csr

Sign the Server Certificate with the CA

    openssl x509 -req -in server.csr -CA ca/certs/ca-cert.pem -CAkey ca/private/ca-key.pem -CAcreateserial -out server.crt -days 365 -sha256

Verify the Server Certificate

    openssl verify -CAfile ca/certs/ca-cert.pem server.crt

Simulate a Client-Server Authentication

- Start a simple server using the server key and certificate

      openssl s_server -cert server.crt -key server.key -accept 8443


- From another terminal, connect to the server as a client

      openssl s_client -connect localhost:8443 -CAfile ca.crt
