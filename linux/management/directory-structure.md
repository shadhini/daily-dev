# Linux Directory Structure

`/opt` - Optional application software packages
- optional application software directory defined by the Filesystem Hierarchy Standard (`FHS`)
- intended for add-on, third‑party, or vendor-supplied packages that are not part of the distribution packaging system
- Typical use: commercial apps, self‑contained binaries, or software you install from tarballs

`/var/lib/apt/lists/*`
- contains the package index files downloaded during `apt-get update`

