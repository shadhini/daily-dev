#  `FHS`: Filesystem Hierarchy Standard

- defines the directory structure and directory contents in Unix-like systems (Linux)
- it gives conventions so users, admins, and packages know where files belong
- different distributions follow FHS with some local differences
- `systemd` and modern distro changes have been widely adopted
  - e.g., /run, /usr merge 

## Top-level directories 
`/ (root)`
- root of the filesystem tree

`/bin`
- essential user command binaries (ls, cp, mv, cat) needed in single-user mode and for all users
- on many modern distros these are symlinked to `/usr/bin` as part of the "usr merge"

`/sbin`
- essential system binaries (fsck, ip, rebuildd) typically for root/admin
- often symlinked to `/usr/sbin`

`/usr`
- read-only, shareable architecture-independent and -dependent programs and data
- `/usr/bin`: non-essential user binaries (mailx, gcc)
- `/usr/sbin`: non-essential system binaries (httpd)
- `/usr/lib`, `/usr/lib64`: libraries for /usr
- `/usr/local`: local admin-installed stuff (compiled from source)
  - Structure: `/usr/local/bin`, `/usr/local/lib`, etc.

`/lib`, `/lib64`
- shared libraries needed to boot and run commands in `/bin` and `/sbin`
  - on multiarch systems, there may be `/lib/x86_64-linux-gnu` etc
- `/lib` vs `/lib64` depends on 32/64-bit packaging; many distros use multiarch directories

`/etc`
- host-specific configuration files 
  - e.g: /etc/hosts, /etc/passwd, /etc/ssh/sshd_config
- no binaries, mostly configs and subdirs like /etc/cron.d, /etc/systemd

`/var`
- variable data—files that change at runtime
- `/var/log`: logs
- `/var/lib`: state information (package DB, databases)
- `/var/run`: historically used for PID files; modern systems use `/run (tmpfs)` and `/var/run` is often symlinked to `/run`
- `/var/tmp`: temporary files preserved across reboots (unlike `/tmp` on some distros)

`/run`
- runtime data since early boot; a tmpfs
  - PID files, sockets, lock files
  - e.g: /run/sshd, /run/lock
- created early in the boot process; replaces the old behavior of `/var/run` for early runtime state

`/tmp`
- temporary files; usually world-writable (mode 1777)
- may be tmpfs or on-disk
- can be cleared on reboot (policy varies)

`/home`
- users’ home directories: /home/alice, /home/bob

`/root`
- Home directory for the root user
- not to be confused with `/`

`/opt`
- optional add-on application software packages (often third-party)
- e.g: /opt/google/chrome

`/srv`
- data served by the system (web, ftp, etc.)
- Example conventions: /srv/www, /srv/www/htdocs

`/media`
- mount points for removable media (automount points managed by desktop environments): /media/cdrom, /media/usb

`/mnt`
- generic mount point for temporarily mounting filesystems
- admins use this for manual mounts

`/proc`
- virtual pseudo-filesystem providing process and kernel information (procfs). e.g., /proc/cpuinfo, /proc/<pid>.

`/sys`
- kernel device tree and attributes (sysfs)
- exposes device and driver attributes to userland

`/dev`
- device nodes (block and character devices). Managed by udev on modern Linux.

`/swap (not standard)`
- swap partitions are usually separate partitions and shown via `/proc/swaps`
- not a standard directory

