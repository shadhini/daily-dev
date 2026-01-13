# MAC Address: Media Access Control address

a unique, permanent identifier burned into your network hardware (NIC) by the manufacturer and doesn't change
- Permanent Hardware ID: your device's physical serial number for a specific network adapter (like Wi-Fi or Ethernet)

but your device can broadcast a different one intentionally due to
- `MAC Randomization`: 
  - Modern operating systems (iOS, Android, Windows) use randomized MAC addresses 
    - for privacy when connecting to new Wi-Fi networks
    - to hide your device's true identity from trackers
- `MAC Spoofing`: 
  - Users or software can deliberately change the MAC address to bypass network restrictions or hide identity.
- `Multiple Adapters`: 
  - A device with both Wi-Fi and Ethernet will have a different MAC address for each physical adapter.

# MAC vs. IP: 

- IP address: a temporary mailing address that changes with networks (DHCP)
- MAC address: the permanent device ID on the local network segment

