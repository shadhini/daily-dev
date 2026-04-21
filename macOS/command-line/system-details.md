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

# MAC Health and Performance Checks

thermal pressure check:
- `Nominal`: the system is running within normal thermal limits
- `Fair`: the system is experiencing some thermal stress, but it’s not critical
- `Serious`: the system is under significant thermal stress, which may lead to performance degradation
- `Critical`: the system is at a critical thermal state, and performance may be severely impacted to prevent overheating 

    sudo powermetrics -s thermal
