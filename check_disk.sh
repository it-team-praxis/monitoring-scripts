#!/bin/bash
# Warn when a filesystem is fuller than the threshold.
THRESHOLD=90

df --output=pcent,target -x tmpfs -x devtmpfs | tail -n +2 |
while read -r pcent target; do
  used=${pcent%\%}
  if [ "$used" -ge "$THRESHOLD" ]; then
    logger -t check_disk "$target is ${used}% full"
    logger -t check_disk "$target is ${used}% full"
  fi
done
