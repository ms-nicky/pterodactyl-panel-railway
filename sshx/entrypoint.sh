#!/bin/sh
set -e

echo "Starting sshx session. Watch 'railway logs' for the share code/URL."
echo "Session will keep alive until container is stopped."

# sshx run starts a share; it prints the URL (e.g. https://sshx.io/<code>).
# Keep running. If it exits, we restart it to keep the session available.
while true; do
  echo "=== launching sshx run ==="
  sshx run 2>&1 || echo "sshx exited (code $?). Restarting in 5s..."
  sleep 5
done