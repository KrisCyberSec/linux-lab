# Scenario 1: Disk filling up

**Symptom:** Health-check script warned the root disk was over 80% full (df showed ~82%).

**Gather info:** `df -h /` confirmed it. `du -h --max-depth=1 / | sort -h` showed /var at 4.4G (normally a few hundred MB).

**Cause:** Drilled into /var, then /var/tmp, and found a 4 GB file (old-backup.img).

**Fix:** Removed the file (in production, I'd confirm with the file's owner first).

**Verify:** `df -h /` back to 36%; health check shows no warning.

**Prevent:** Monitoring caught it early. Next steps would be alerting someone instead of only logging, and a cleanup policy for temp/backup files.
