#!/bin/sh
set -e

echo "Generating wings config from environment..."

mkdir -p /etc/pterodactyl /var/lib/pterodactyl/volumes /var/lib/pterodactyl/archives /var/lib/pterodactyl/backups /var/log/pterodactyl /tmp/pterodactyl

cat > /etc/pterodactyl/config.yml <<YAML
debug: false
uuid: ${WINGS_UUID:-}
app_name: Railway Wings
token_id: ${WINGS_PANEL_TOKEN_ID}
token: ${WINGS_PANEL_TOKEN}
api:
  host: 0.0.0.0
  port: 8080
  ssl:
    enabled: false
  upload_limit: 100
  trusted_proxies:
    - 0.0.0.0/0
    - "::/0"
system:
  root_directory: /var/lib/pterodactyl
  log_directory: /var/log/pterodactyl
  data: /var/lib/pterodactyl/volumes
  archive_directory: /var/lib/pterodactyl/archives
  backup_directory: /var/lib/pterodactyl/backups
  tmp_directory: /tmp/pterodactyl
  username: pterodactyl
  timezone: UTC
docker:
  socket: /var/run/docker.sock
remote: ${WINGS_PANEL_URL}
remote_query:
  timeout: 30
YAML

echo "Wrote /etc/pterodactyl/config.yml:"
cat /etc/pterodactyl/config.yml

echo "Starting wings..."
exec wings --config /etc/pterodactyl/config.yml
YAML