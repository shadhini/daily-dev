# Resize partitions of Linux and Windows in dual boot, when Linux partition is LUCKS encrypted

## Shrinking Linux partition

### 1. Prepare a Live USB and Boot into the Live USB

You need to boot from an Ubuntu Live USB (installation media) 
because you cannot resize the partition you are currently using.

Insert the USB, restart your computer, and boot into the "Try Ubuntu" mode.

### 2. Unlock the Encrypted Partition

identify your linux partition
```shell
lsblk -f
```
e.g: /dev/sda6
```text
sda6
└── crypto 2    e7036c4b-f7d1-4773-9850- fce220a0ae7e
```

unlock the encrypted partition
```shell
sudo cryptsetup open /dev/sda6 cryptdata
```

### 3. Activate the Volume Group
We need to find your Volume Group (VG) name and activate it so we can resize the Logical Volumes.
```bash
sudo vgscan
sudo vgchange -a y
```
*   Note the VG name found (e.g: `ubuntu--vg-ubuntu--lv`)

### 4. Shrink the Filesystem (The Data)
We are going to shrink the filesystem to **60GB** (smaller than your 70GB target) to be safe.
1.  **Check the filesystem for errors** (Required before resizing):
    ```bash
    sudo e2fsck -f /dev/mapper/ubuntu--vg-ubuntu--lv
    ```
2.  **Shrink the filesystem:**
    ```bash
    sudo resize2fs /dev/mapper/vgubuntu-root 60G
    ```

### 5. Shrink the Logical Volume (LVM)
Now that the filesystem is 60GB, we make the Logical Volume holding it 60GB.
```bash
sudo lvreduce -L 60G /dev/mapper/ubuntu--vg-ubuntu--lv
```

You should see your root volume is now the smaller size
```shell
sudo lvs
```

### 6. Shrink the Physical Volume (PV)
Now we tell LVM that it doesn't need all that space.
We will resize the LVM container / Volume Group / Physical Volume to match the new size.

```bash
sudo pvresize /dev/mapper/cryptdata
```

### 7. Shrink the LUKS Container
Now we shrink the encryption layer to **62GB** (Another small buffer).
1.  Identify the block size of the encrypted container (e.g., /dev/mapper/cryptdata)
    ```shell
    sudo blockdev --getss /dev/sdX
    ```
2.  **Calculate the new size in sectors based on the new size you want for the partition: **
   - SECTORS: The new size of the encrypted container in sectors.
   - You can calculate this based on the new size you want for the partition
     - e.g: if you want to shrink to 62GB, calculate how many sectors that is
       - 62GB = 100 * 1024 * 1024 * 1024 bytes
       - 1 sector = block size = 512 bytes
       - SECTORS = (62 * 1024 * 1024 * 1024 * 1024) / 512 = 129,999,974 (approx **130,023,424** sectors)
       
3.  **Resize:**
    ```bash
    sudo cryptsetup resize --size <SECTORS> cryptdata
    ```

check whether there is a mismatch of size using
```shell
sudo lvs
```

### 8. NOW Use GParted
Now that the "insides" are definitely only ~62GB:
1.  Open **GParted**.
2.  Refresh devices.
3.  Select your partition `/dev/sda6`.
4.  Select **Resize/Move**.
5.  Now set the size to your desired **70,000 MiB**.
6.  Apply the changes.
7. **It should work now** because 70GB is much larger than the 62GB contents we just set.

### 9. Expand the Insides Back (Optional but Recommended)
After GParted finishes resizing the partition to 70GB:
1.  Maximize the LUKS container to fill the new partition:
    ```bash
    sudo cryptsetup resize cryptdata
    ```
    *(No size argument = "fill available space")*
2.  Maximize the Physical Volume:
    ```bash
    sudo pvresize /dev/mapper/cryptdata
    ```
3.  Maximize the Logical Volume:
    ```bash
    sudo lvextend -l +100%FREE /dev/mapper/vgubuntu-root
    ```
4.  Maximize the Filesystem:
    ```bash
    sudo resize2fs /dev/mapper/vgubuntu-root
    ```

## Expanding Windows Partition

Expanding a Windows partition using space that currently "belongs" to the Linux side of a dual-boot setup is 
a bit like trying to move a room from one side of a house to the other. 
Because Windows and Linux use different file systems (NTFS vs. ext4/Btrfs), and 
partitions are physical segments on your disk, the position of that unallocated space matters immensely.

### Using GParted (The Recommended Way)
If the partition between your Windows drive and the unallocated space is your Linux partition and 
it's encrypted (LUKS), you cannot move it while you are booted into it.

1.  Use a Live USB: 
    You must boot from a Linux Live USB (like Ubuntu or Fedora) rather than your installed OS. 
    You cannot move a "house" while you are standing inside it.
2.  Unlock the Partition: * Open GParted on the Live USB. 
    - Right-click the encrypted partition and select Open Encryption. 
    - Enter your passphrase.
3.  Resize/Move: Once "Open," GParted treats the inner file system as movable. 
    You can then slide the partition to the right to move the unallocated space to the left.
4.  Apply Changes: Click the checkmark icon. 
    This may take some time as the computer physically moves data on the disk.

### Expand Windows: 
Once the unallocated space is sitting directly next to your Windows (NTFS) partition, 
you can either expand it right there in GParted or boot back into Windows and use Disk Management to "Extend Volume."

