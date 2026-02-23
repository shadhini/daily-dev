# DNS over HTTPS (DoH)

`a protocol that sends DNS queries and receives responses over HTTPS (HTTP/2 or HTTP/3)`
- encrypts DNS traffic so it cannot be read or modified by passive observers on the network
- provides confidentiality and integrity from the client to the chosen DNS resolver
- prevents `passive eavesdropping` and `many on-path` attacks
  - e.g: DNS spoofing, simple censorship at the DNS level

Traditional DNS queries are sent in plaintext over UDP/TCP
- so anyone on the path (Wi‑Fi networks, ISPs, corporate networks) can see and tamper with which hostnames you resolve

## How DoH works 

- The client (browser or OS/agent) sends DNS queries as HTTP requests to a DoH server (resolver) using TLS.
- `RFC 8484` defines a binary wire format using the media type application/dns-message. 
  - Many providers also support a JSON response API for convenience. 
- Requests can use GET (with the DNS message base64url-encoded in a query param) or POST (body = raw DNS wire format).
- The DoH server decodes the DNS message, performs the lookup, and returns the DNS response inside the HTTPS response.
