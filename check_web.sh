#!/bin/bash
# Warn when a web site does not answer.
for url in https://intranet.example.com https://www.example.com; do
  if ! curl -fsS -o /dev/null --max-time 10 "$url"; then
    logger -t check_web "$url does not answer"
  fi
done

