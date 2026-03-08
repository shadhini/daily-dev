# Run docker container with GUI on MacOS

## Option 1: XQuartz + X11 forwarding
X11 forwarding (XQuartz on macOS + set DISPLAY in the container)
- Quick & lightweight
- Good for single X11 apps

## Option 2: VNC / noVNC containers
run a desktop inside the container and connect with VNC or a browser

This is usually the simplest and most reliable approach on macOS
because everything stays inside the container and you connect with VNC or via browser (no X server setup on mac).

- Easier, full-desktop experience
- More self-contained and often easier to get working on macOS


# VNC-enabled docker container

a container that runs a graphical desktop or GUI application inside the container and exposes it via a VNC server 
(or a Web VNC like noVNC) so you can connect remotely with a VNC client or browser

## Popular community images:
- `consol/ubuntu-xfce-vnc` (desktop + noVNC)
- `dorowu/ubuntu-desktop-lxde-vnc`
- `jlesage/firefox` (single-app container with VNC/noVNC)

# VNC-enabled Docker images comparison

| Feature                                            | consol/ubuntu-xfce-vnc                                                                                           | dorowu/ubuntu-desktop-lxde-vnc                                                                                           | jlesage/firefox                                                                                        |
|:---------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------|
| Purpose                                            | Full Ubuntu desktop (XFCE) + VNC + noVNC                                                                         | Lightweight Ubuntu desktop (LXDE) + VNC + noVNC                                                                          | Single-application container running Firefox with VNC/noVNC                                            |
| UI type                                            | Full desktop (multi-app)                                                                                         | Full desktop (multi-app, lightweight)                                                                                    | Single app (Firefox)                                                                                   |
| Default desktop environment                        | XFCE                                                                                                             | LXDE                                                                                                                     | N/A (Firefox only)                                                                                     |
| Typical use cases                                  | Development, demos, multi-app interactive sessions, general desktop-in-container                                 | Resource-constrained desktop sessions, lightweight multi-app needs                                                       | Remote browser, kiosk, automated/browser testing, single-app isolation                                 |
| Resource footprint                                 | Moderate (larger than LXDE)                                                                                      | Smaller than XFCE (lighter memory/CPU)                                                                                   | Smallest (single app), but includes browser runtime                                                    |
| Persistence / volumes                              | Mount /home or specific dirs to persist user data                                                                | Mount /home or specific dirs to persist user data                                                                        | /config volume provided for profile, bookmarks, settings (explicit)                                    |
| Ease of use / features                             | Polished desktop experience; good default tooling                                                                | Fast start, minimal desktop niceties                                                                                     | App-optimized settings, env variables, and built-in config handling                                    |
| Security considerations                            | Exposes VNC/noVNC — do not expose publicly; set strong password, use SSH tunnel or HTTPS reverse proxy           | Same as consol — lighter image does not change exposure risk                                                             | Same cautions; jlesage exposes config options to set passwords and UID/GID                             |
| GPU / hardware acceleration                        | Possible with extra setup (NVIDIA toolkit or /dev/dri mapping); more config needed                               | Easier to run headless, but GPU mapping still required for acceleration                                                  | jlesage docs typically include guidance for GPU passthrough (easier for single-app)                    |
| Customization & extendability                      | High — install additional apps, IDEs, etc.                                                                       | Good — but fewer desktop features to customize by default                                                                | Limited to Firefox (but can extend/open settings); not intended as a full desktop                      |
| Common ports (verify docs)                         | Common mappings: 5901 (VNC), 6901 (noVNC/web)                                                                    | Common mappings: 5901 (VNC), 6901 (noVNC/web)                                                                            | Common mappings vary by tag: often 5900 (VNC) and 5800 (noVNC/web). Check image docs.                  |
| Minimal run example (adjust ports/paths as needed) | `docker run -d -p 5901:5901 -p 6901:6901 -e VNC_PASSWORD=pass -v /host/home:/home/ubuntu consol/ubuntu-xfce-vnc` | `docker run -d -p 5901:5901 -p 6901:6901 -e VNC_PASSWORD=pass -v /host/home:/home/ubuntu dorowu/ubuntu-desktop-lxde-vnc` | `docker run -d -p 5800:5800 -p 5900:5900 -e VNC_PASSWORD=pass -v /host/config:/config jlesage/firefox` |
| Maintenance / community                            | Widely used; docs on Docker Hub; community examples available                                                    | Popular for lightweight desktop-in-container use-cases                                                                   | Actively maintained jlesage images with clear per-image docs and common patterns                       |
| Recommended when                                   | You want a full-featured containerized desktop for multiple apps                                                 | You need a lightweight desktop environment with lower resource usage                                                     | You only need Firefox (remote browser) or a small single-app container with persistent profile         |



