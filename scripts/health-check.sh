#!/bin/bash
# health-check.sh - quick server health report

echo "=== Health check: $(hostname) at $(date) ==="

# Disk: warn if the main disk is over 80% full
disk_used=$(df / --output=pcent | tail -1 | tr -dc '0-9')
echo "Disk used on /: ${disk_used}%"
if [ "$disk_used" -gt 80 ]; then
  echo "WARNING: disk is over 80% full"
fi

# Memory: show how much is free to use
free -h | awk '/Mem/ {print "Memory available: " $7 " of " $2}'

# Services: check the important ones are running
for service in nginx chrony ufw; do
  if systemctl is-active --quiet "$service"; then
    echo "OK: $service is running"
  else
    echo "WARNING: $service is NOT running"
  fi
done


