#!/bin/bash
cd /home/z/my-project
while true; do
  echo "[$(date)] Starting server..." >> /home/z/my-project/dev.log
  bun .next/standalone/server.js >> /home/z/my-project/dev.log 2>&1
  echo "[$(date)] Server crashed, restarting in 2s..." >> /home/z/my-project/dev.log
  sleep 2
done
