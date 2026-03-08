# Running Portable Windows Executables on Ubuntu

- Fastest and easiest for many simple GUI/CLI apps: 
  - `Wine` (or `Bottles`/`PlayOnLinux`/`Crossover`). 
  - Good compatibility for many apps; lower overhead.
- Best compatibility (anything Windows can run): 
  - full `VM` (`KVM`/`VirtualBox`) with Windows installed. 
  - Highest resource cost, best isolation.
- Reproducible / containerized approach: 
  - `Wine` in a `Docker` container or a purpose-built container image. 
  - Useful for server automation or reproducible environments, but GUI and GPU require extra setup.
- For games: 
  - `Proton` (Steam), `Wine` + `DXVK/VKD3D`, or a `VM` with `GPU passthrough` for the most accurate experience if needed.
- For .NET/.NET Core apps: 
  - check if the app targets `.NET Core/.NET 5+` — those often run natively on Linux without Wine. 
  - If it’s `.NET Framework`, Wine or VM is required (or Mono for older apps).

Recommendation:

1. First try to see whether the `.exe` actually contains a `.jar` you can run natively with OpenJDK on Ubuntu. 
    - If it does, running the jar natively is the simplest and fastest option. 
    - Inspect the .exe to see if it contains a JAR or is just a Java wrapper
        - If 7z or strings shows .jar, .class, or META-INF, it probably embeds a jar you can extract.
        - If you see packers/launchers names (launch4j, exe4j, JSmooth, izpack, install4j), that indicates a Java launcher wrapper — often the jar can be extracted.
        - If you see references to native DLL names, COM, or vendor-specific drivers, the app likely needs Windows 
      native APIs.

     ```shell
     # replace HEC-ResSim.exe with your filename
     file HEC-ResSim.exe
     strings HEC-ResSim.exe | sed -n '1,200p'
     7z l HEC-ResSim.exe | sed -n '1,200p'   # lists archive contents if the exe is an archive/installer
     ```
   - If you find a JAR inside, extract it and run it with OpenJDK.
2. If it’s a Windows launcher or embeds native Windows code (JNI, Windows services, or interacts with Windows‑only 
      libraries), try Wine next.
3. If the app must have perfect Windows behavior (registry keys, Windows drivers, vendor support), use a Windows VM 
   (KVM/virt‑manager or VirtualBox).

## Wine (native Windows-API reimplementation)
- Compatibility layer implementing Win32 APIs so many Windows binaries run directly on Linux.
- Pros:
    - Low overhead — near-native CPU performance.
    - Fast startup, lightweight on resources.
    - Integrates with host X11/Wayland desktop (can appear like native apps).
    - Active tooling: winetricks, Bottles, Lutris, PlayOnLinux, Proton (for games).
    - Good for many utilities, older apps, and many games (especially with DXVK).
- Cons:
    - Not 100% compatible (some apps require Windows-specific services/drivers).
    - Troubleshooting can be required (registry tweaks, DLL overrides).
    - GUI or DirectX apps may need extra layers (DXVK, VKD3D).
    - Security boundary is weaker than a VM — Wine processes run as your user.
- Best for: 
  - utilities, many GUI apps, lots of games with DXVK, apps that don't require kernel drivers or Windows services
- Tips: 
  - use separate wineprefixes per app
  - use 32-bit prefix for 32-bit apps
  - use winetricks to install dependencies
    - Bottles simplifies management


## Virtual Machine (VirtualBox, KVM/QEMU, VMware)
- Full hardware virtualization running a real Windows OS inside Linux.
- Pros:
    - Highest application compatibility — almost any Windows app runs.
    - Strong isolation: guest is sandboxed from host.
    - You can snapshot and restore; good for testing.
    - Supports running Windows services, drivers, and kernel-mode features.
- Cons:
    - Resource-heavy: full RAM/CPU/disk for the guest OS.
    - Slower I/O/graphics unless you use GPU passthrough (complex).
    - Requires a Windows license.
    - Integration (clipboard, file sharing) requires guest tools (Guest Additions).
- Best for: 
  - enterprise apps requiring exact Windows behavior
  - apps needing Windows services or drivers
  - apps requiring IE/Edge-specific features 
  - high-security sandboxing
- Tips: 
  - use KVM+virt-manager for best performance on Linux
  - for high-end games, GPU passthrough (vfio) is possible but complex
  - VirtualBox is easier for casual use


## Docker container with Wine (containerized Wine)
- Run Wine inside a Linux container. Useful for reproducibility and CI-style deployments.
- Pros:
    - Reproducible and portable environment (Dockerfile).
    - Easier to deploy the same environment to other machines.
    - Adds an isolation layer (container) compared to running Wine directly.
- Cons:
    - Containers have no GUI by default — you must forward X11/Wayland, use xpra/VNC/RDP, or bind the X11 socket (security implications).
    - GUI and GPU acceleration require additional setup (expose /dev/dri, pass through Vulkan libs/drivers).
    - Wine in container still uses host kernel — some drivers/services won't work.
    - Slight performance overhead vs native Wine, but still less than VM.
- Best for: 
  - headless apps
  - automating Windows-only CLI tools
  - building reproducible test environments
  - when you want environment portability
- Tips: 
  - use existing images (e.g., jlesage/wine or scottyhardy/docker-wine) as a starting poinr
  - map X11 socket or use xpra for GUI

