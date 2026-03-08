# ldd
`an external command-line utility`


`ldd` prints the shared library dependencies of a dynamically-linked ELF executable or shared object (`.so`)

```shell
$ ldd /opt/HEC-HMS-4.8/bin/libjavaHeclib.so 

    linux-vdso.so.1 (0x0000728a15495000)
    libz.so.1 => /lib/x86_64-linux-gnu/libz.so.1 (0x0000728a15460000)
    librt.so.1 => /lib/x86_64-linux-gnu/librt.so.1 (0x0000728a1545b000)
    libgfortran.so.4 => not found
    libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x0000728a15372000)
    libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x0000728a14200000)
    /lib64/ld-linux-x86-64.so.2 (0x0000728a15497000)
```