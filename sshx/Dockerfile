FROM alpine:3.20

RUN apk add --no-cache curl bash tini

# Install sshx binary during build
RUN curl -sSf https://sshx.io/get | sh -s install

COPY sshx/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/sbin/tini", "--", "/entrypoint.sh"]