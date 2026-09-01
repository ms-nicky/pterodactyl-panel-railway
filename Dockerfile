FROM ghcr.io/pterodactyl/panel:latest

USER root

# Remove the Laravel schema dump so `php artisan migrate` does not shell out
# to the `mysql` client (which fails on Railway MySQL due to
# self-signed TLS certificate: ERROR 2026 HY000).
RUN rm -f /app/database/schema/mysql-schema.sql /app/database/schema/schema.json