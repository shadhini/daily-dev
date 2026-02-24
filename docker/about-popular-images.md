# Popular Images

`alpine`
- tiny (usually ~5–10 MB)
- C library: `musl` libc
  - on Alpine pip may compile C extensions (slower) or fail
  - Some precompiled binaries expect glibc; they can fail on musl
  - you can install glibc into Alpine via unofficial packages, but that adds complexity
  - uses musl time functions — subtle runtime differences sometimes appear
- Package manager: `apk` 
- Build/tooling: may force you to compile things from source (install build-base/build-essential), increasing build time
- Debugging: minimalist (BusyBox, ash), `systemd` is not available
- Security, updates, and surface area:
  - have smaller attack surface 
  - availability of security updates depends on distribution and your update process
- When to choose
  - great when you need the smallest possible image and your app/build toolchain works with musl
  - you care strongly about image size
  - app is statically-linked or pure-Go/static binary, or you can handle musl quirks and long compile-from-source installs
  - accept extra work when debugging or installing uncommon packages
  - app is pure-Python or depends only on wheels compatible with musl

`ubuntu (or debian-slim)`
- much larger (tens of MBs — typically 50–200+ MB depending on tag)
- C library: `glibc` — better binary compatibility
  - Many Python wheels are built for glibc (manylinux)
- Package manager: `apt` — richer package ecosystem
- Debugging: Ubuntu images include more familiar tools — easier debugging
- Security, updates, and surface area:
  - have regular security updates 
  - have more mature tooling for enterprise patching
  - need Ubuntu-specific packages or environment parity with host infrastructure
  - accept larger image size for familiarity or corporate policy

`python:3.11-slim`
- official Python image with CPython 3.11 preinstalled on a Debian "slim" base (glibc)
- minimal, stable container
- smaller than full ubuntu but bigger than alpine
  - there are also python:3.11-alpine tags if you explicitly want Alpine + Python
- C library: `glibc`
  - most manylinux wheels and prebuilt binary dependencies work out of the box
  - reduces build complexity and failures
- Package manager: `apt` 
  - broad package availability and familiar package names
  - easier for C extension build deps (build-essential, python3-dev, libssl-dev, libpq-dev...)
- Security, updates, and surface area:
  - "slim" images strip docs and locales to reduce size 
  - still get apt security updates
- when to use
  - for the simplest, most compatible Python images in production (preinstalled CPython, glibc, apt)
  - the best default for most apps
  - want a reliable, compatible Python base 
  - app uses many third-party wheels or C extensions (e.g., psycopg2, numpy, cryptography)
  - want fewer surprises and faster builds
