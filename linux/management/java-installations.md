# Java Installations

`OpenJDK`
- open-source reference implementation of Java SE specification
- the source code and official reference builds
- licensed under GPLv2 + Classpath exception

`AdoptOpenJDK`
- successor `Adoptium/Temurin`
- community-produced binaries built from OpenJDK sources
  - a community project (2017–2021) that produced prebuilt OpenJDK binaries for many platforms
  - in 2021 the build/infra moved to the Eclipse Foundation under the `Adoptium` working group
    - their binary distribution is called Temurin
- 

`OpneJDK` & `AdoptOpenJDK/Adoptium/Temurin` Differences
- who builds/distributes the binaries
- update/support policies
- packaging 
- optional JVM/runtime choices (HotSpot vs OpenJ9)

| Category                                | OpenJDK                                                                                                      | Other Binary Builds (Temurin, Corretto, Zulu, etc.)                                                                                                                                                                                 |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Who builds and signs binaries**       | OpenJDK source is the upstream reference implementation.                                                     | Binary builds provided by: Adoptium/Temurin, Oracle, Red Hat, Amazon Corretto, Azul Zulu, and distro packages.                                                                                                                      |
| **Packaging & installation experience** | Distro packages (e.g., `openjdk-11-jdk` on Debian/Ubuntu) integrate with OS packaging and update systems.    | Platform packages, tarballs, containers, apt/yum repos, and installers. Multi-platform support.                                                                                                                                     |
| **Update cadence & security fixes**     | Follow OS vendor's security update lifecycle and release schedule. May be slower depending on distro policy. | Vendor/distributor determines speed of fixes and LTS backports. Some have long-term maintainers (Corretto, Azul, Red Hat).                                                                                                          |
| **JVM implementation variants**         | Typically uses HotSpot (the standard OpenJDK JVM).                                                           | Most use HotSpot. Some providers (e.g., IBM Semeru) offer Eclipse OpenJ9 for lower memory footprint and faster startup.                                                                                                             |
| **Support & SLAs**                      | Community-supported through distro. Support depends on OS vendor's policies.                                 | Community builds (Temurin) are free and community-supported. Commercial vendors (Azul, Oracle, Red Hat) offer paid support and enterprise SLAs.                                                                                     |
| **Build-time patches and testing**      | Distro maintainers apply patches and QA aligned with OS policies.                                            | Vendors may apply additional patches, perform extra QA, or enable different defaults (GC, logging) which can affect performance/diagnostics.                                                                                        |
| **Licensing**                           | GPLv2 + Classpath exception (fully open-source).                                                             | Usually GPLv2 + Classpath exception or compatible terms; vendor-specific terms may apply for support or additional components — always check the vendor license for commercial use.                                                 |
| **How to tell what you have**           | Run `java -version`: `OpenJDK Runtime Environment (build 11.0.x+xx-Ubuntu-...)`                              | Run `java -version`: **Temurin:** `OpenJDK Runtime Environment Temurin-11.0.x+xx (build 11.0.x+xx)`                                                                                                                                 |
| **How to choose**                       | Use if you want easiest OS-integrated installs/patching and prefer minimal external repos.                   | Use if you want vendor-supplied binaries, potentially faster updates, multi-platform installers, or a particular JVM (OpenJ9) or support option. Choose a vendor with a support policy matching your production LTS/security needs. |
