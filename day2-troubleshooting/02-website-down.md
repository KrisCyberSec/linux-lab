# Scenario 2: Website down after config change

**Symptom:** Site not loading; `curl localhost` failed after nginx was restarted.

**Gather info:** `systemctl status nginx` showed "failed". The logs (`journalctl -u nginx`) showed `[emerg] invalid parameter "listen"`. `nginx -t` pointed to sites-enabled/default line 23.

**Cause:** Missing semicolon at the end of line 22 (`listen 80 default_server`). nginx reported the next line, where it got confused, so I checked the line before it.

**Fix:** Added the `;` in nano.

**Verify:** `nginx -t` passed, restarted nginx, status active (running), page loads in curl and Safari.

**Prevent:** Always run `nginx -t` before restarting after a config change, and keep configs in Git so changes can be reviewed and rolled back.
