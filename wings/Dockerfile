FROM ghcr.io/pterodactyl/wings:latest AS wingsbase
FROM alpine:3.20

COPY --from=wingsbase /usr/bin/wings /usr/bin/wings
COPY wings/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh /usr/bin/wings

ENTRYPOINT ["/entrypoint.sh"]