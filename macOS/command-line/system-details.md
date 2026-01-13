# MAC address

    ifconfig

- Find your adapter and look for the `ether` address, which is the MAC address
  - adapter 
    - `en0` or `en1` for Wi-Fi
    - `en2` for Ethernet

# Processor Related Information

#### number of physical processors

    sysctl hw.physicalcpu

#### number of logical processors

    sysctl hw.logicalcpu