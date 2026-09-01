#!/bin/sh
set -e

echo "Generating wings config from environment..."

mkdir -p /etc/pterodactyl /var/lib/pterodactyl /var/log/pterodactyl

cat > /etc/pterodactyl/config.yml <<YAML
debug: false
uuid: ${WINGS_UUID:-}
app_name: Railway Wings
wings:
  log_directory: /var/log/pterodactyl
  data: /var/lib/pterodactyl
  statistics:
    enabled: false
  ui:
    enabled: false
system:
  time_zone: UTC
panel:
  url: ${WINGS_PANEL_URL}
  token_id: ${WINGS_PANEL_TOKEN_ID}
  token: ${WINGS_PANEL_TOKEN}
cfg:
  timeout: 10
YAML

echo "Wrote /etc/pterodactyl/config.yml:"
cat /etc/pterodactyl/config.yml

echo "Starting wings..."
exec wings --config /etc/pterodactyl/config.yml
YAML