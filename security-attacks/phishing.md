# Phishing Attacks

## What phishing attacks look like (attack flow)

- Attacker chooses a target -- broad or specific 
- Crafts a message that appears legitimate 
  - spoofed sender, urgent request, lookalike domain 
- Sends the message -- email, SMS, voice, social media
- Victim clicks link, opens attachment, or replies 
  - leading to credential capture, malware install, wire transfer, data exfiltration
- Attacker uses access or funds and may perform lateral movement

Examples:
```text
“Your mailbox is full. Click here to increase quota” 
```
→ fake login page

```text
“Urgent wire transfer — send payment to this account now”
```
→ BEC: Business Email Compromise

```text
SMS: “Bank alert: Suspicious activity. Verify here: tinyurl/xyz”
```
→ credential harvest


## Common phishing types

- `Email phishing (bulk)`: 
  - generic messages asking you to verify account, claim a prize ... 
  
- `Spear phishing`: 
  - targeted to a person or department 
  - uses personal/company details

- `Whaling`: 
  - targets high-value executives with business/finance requests

- `Clone phishing`: a 
  - real-looking email is copied and altered with malicious links/attachments

- `Business Email Compromise (BEC)`: 
  - attacker spoofs or compromises an executive or vendor to request wire transfers or invoice payments

- `Vishing (voice phishing)`: 
  - phone call impersonating bank/IT

- `Smishing (SMS phishing)`: 
  - malicious SMS with links or callback numbers

- `Social-media phishing`: 
  - fake profiles/messages with malicious links

## Red flags / indicators of phishing

- Unexpected request for credentials, personal info, or money 
- Sense of urgency or threats (pay now or lose access)
- Links that don’t match the visible text or that use domains with small typos/subdomains 
  - e.g: acct.example.com.attacker.com
- Attachments with unusual file types 
  - `.exe`, `.scr`, `.js`, `.zip` with `.exe` inside or 
  - macros in Office files
- Sender address doesn’t match expected domain, or uses lookalike Unicode characters
- Requests to bypass normal processes 
  - e.g: “pay this invoice urgently — don’t follow procurement process”

## Do's:

- Use MFA & password manager
- Inspect sender and links before interacting
- Report suspicious messages
- Verify requests for money via a second channel
- Keep systems patched and back up data

## Don’t:
- Reuse passwords
- Enter credentials on pages reached from unsolicited links
- Open unexpected attachments or enable macros
- Ignore reports of suspicious activity

## How to check suspicious email safely

- Don’t click links or download attachments
- Inspect the sender’s full email address (not just display name)
- Hover over links to see destination domain (but don’t click)
- View message headers to see the real sending path and SPF/DKIM/DMARC results
- If it claims to be from an internal colleague/executive, call them using a known phone number to verify

## Prevention — Individuals

- Use unique, strong passwords and a password manager 
- Enable MFA: multi-factor authentication 
  - prefer phishing-resistant methods 
    - hardware tokens like `FIDO2`, `pushless FIDO U2F` 
    - `WebAuthn`
- Never reuse work credentials on personal sites 
- Keep OS and apps patched; enable automatic updates 
- Don’t enable macros in Office files from untrusted sources 
- Think before you click: verify unusual requests via a separate channel 
  - phone, company chat
- Report suspicious messages to your organization’s security team or your email provider

## Prevention — Organizations (practical program)

- Email authentication: 
  - `SPF`: Sender Policy Framework -> tells receivers which IPs can send mail for your domain
  - `DKIM`: DomainKeys Identified Mail -> cryptographic signature in email headers proving the message came from the owner of the domain
  - `DMARC`: Domain-based Message Authentication, Reporting, and Conformance -> instructs receivers how to handle messages that fail `SPF`/`DKIM` and provides reporting
  - `DMARC` with reject/quarantine policies; publish `DMARC` reporting
- Implement `MTA-STS` and `TLS` for secure mail transport when possible
- Deploy email security gateway with
  - URL rewriting: rewrite URLs in incoming mail to scan/rewritten safe landing pages  
  - attachment sandboxing: execute attachments in isolated environment
  - anti-phishing heuristics
- Use Anti-Phishing `DMARC` monitoring and `BIMI` (optional)
- Enforce organization-wide `MFA`
  - prefer phishing-resistant factors for critical access
  - Phishing-resistant MFA -- `FIDO2`/`WebAuthn`: prevents credential replay via fake login pages
- Enforce the least privilege and segmentation (limit lateral movement)
- Endpoint protection + `EDR` that can detect and contain malware and unusual behavior
- Regular security awareness training and phishing simulation exercises
- Business process controls for payments: 
  - multi-person approvals for wire transfers, verification via known channels, cross-check invoices
- Logging, monitoring, and alerting for suspicious auth attempts, unusual data access, and new account creation



## Incident response — if you suspect compromise Immediate steps

- Don’t panic
- Disconnect the affected device from the network if you suspect malware 
- Change compromised credentials from a known-good device (not the suspected one)
  - Prioritize accounts with admin/financial privileges 
- Enable or rotate MFA tokens as needed 
- Preserve evidence: save the phishing email (full headers) and any malicious attachments 
- Notify your security team / SOC and leadership (include user, time, email headers, screenshots)
- If a wire transfer occurred, notify finance/bank immediately and follow wire-recall processes 
- Run antivirus/EDR scans and forensic analysis to find onward access 
- Revoke session tokens and access keys, reset credentials, rotate certificates if needed 
- Communicate to potentially impacted users/customers and file regulatory notifications if required



