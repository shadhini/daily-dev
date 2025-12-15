# Key Exchange

## Diffie-Hellman 

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
