# Linux Admin Lab

A hands-on home lab where I built, secured, and monitored an Ubuntu server from scratch to develop Linux system administration skills. Each step is documented in `day1-setup/` and in the commit history.

## Environment
- Ubuntu 26.04 LTS virtual machine (Multipass on macOS, ARM64)
- 10 GB disk, 2 GB RAM

## What I built
1. **Baseline and patching:** found the root disk at 64% on the default build and rebuilt with more space. Applied 55 updates (26 security) and rebooted to load the new kernel, verified with `uname -r`.
2. **Admin account:** created a personal sudo user instead of using the shared default account.
3. **SSH keys:** ed25519 key login with correct permissions (700/600), verified from my Mac.
4. **SSH hardening:** disabled root login and enforced key-only auth (`10-hardening.conf`). Validated with `sshd -t`, confirmed with `sshd -T`, and kept a second session open to avoid lockout.
5. **Time sync:** found the clock about 4 hours behind and forced a chrony resync.
6. **Web server:** nginx, enabled at boot, serving a custom page.
7. **Firewall:** ufw denies all incoming traffic except SSH (22) and HTTP (80). Allowed SSH before enabling.
8. **Monitoring:** `scripts/health-check.sh` checks disk, memory, and services. Tested by stopping nginx, scheduled with cron every 5 minutes, and the log is rotated weekly with logrotate.

## Problems I ran into and fixed
- Default disk too small: rebuilt before installing anything
- Password accidentally exposed in shell history: cleared the history and rotated the password
- Clock drift after the host slept: forced an NTP resync
- Page unreachable in one browser but fine in Safari: traced it to the client, not the server

## Skills practiced
Linux command line, users/groups/permissions, apt, systemd services, SSH, ufw, NTP, Bash scripting, cron, logrotate, Git

## Next
Day 2: break-fix troubleshooting (full disk, failed services, permissions, runaway processes)
