# Linux Directory Structure

`/opt`
- third-party, add-on, self-contained binaries/apps, vendor-supplied packages, software you install from tarballs, commercial apps
- that are not part of the distribution packaging system

`/usr/local` (preferred)
- locally compiled or admin-installed software

`/usr`
- distribution packages
- package-managed system files

`/bin`, `/sbin`, `/lib` (or their `/usr` equivalents if the system uses the /usr merge)
- static, essential OS binaries and libs needed for boot

`/etc`
- host-specific configuration
- configuration files for services: `/etc/<service>` or `/etc/<service>.d`

`/var`
- variable data that changes at runtime
- persistent service state and databases: `/var/lib/<service>`

`/var/log/<service>.log` or `/var/log/<service>/`
- logs

`/var/lib/apt/lists/*`
- contains the package index files downloaded during `apt-get update`

`/var/cache/apt/archives`
- apt cache / archives (if you need to keep .deb files for some reason) 

`/var/tmp`
- temporary files that must survive reboots

`/home`
- user home directories

`/run`
- temporary runtime state
- ephemeral (cleared at boot or on rotation)

`/run/<service>`
- runtime sockets and PID files
- do not store persistent state here
- ephemeral (cleared at boot or on rotation)

`/tmp`
- truly temporary, ephemeral files
- ephemeral (cleared at boot or on rotation)

`/proc`, `/sys`, `/dev`
- virtual filesystems



## Modern distro notes and “/usr merge”
- Many distros have moved to a merged layout where `/bin`, `/sbin`, `/lib` are symlinked to `/usr/bin`, `/usr/sbin`, `/usr/lib` (the "usr merge")
  - this simplifies maintenance because `/usr` is not required to be on a separate partition
- `systemd` introduced `/run` (tmpfs) and many distros use `/run` instead of `/var/run` early in boot
- Always check your distro specifics: Debian, Ubuntu, Fedora, RHEL may have small differences

## 64-bit vs 32-bit library layout
- Some distros use `/lib` and `/lib64`
  - others use multiarch directories like `/lib/x86_64-linux-gnu`.
- Use the distro-provided layout and package manager to avoid conflicts

## Security & permissions
- World-writable directories that must have sticky bit (t): `/tmp`, `/var/tmp`, possibly `/run/user/<uid>`
- Keep `/etc` writable only to root
  - protect config files with appropriate permissions
- Avoid running services as root where possible; use least privilege

