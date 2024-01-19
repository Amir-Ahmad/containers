FROM ghcr.io/onedr0p/alpine:rolling@sha256:51632d23e56ae28a34f8e90df6fe8d02730b5462697ae52e8b01ad6484497819

ARG VERSION
ARG GUI_VERSION=v1.1.0

ENV HOME=/config \
    XDG_CONFIG_HOME=/config \
    XDG_DATA_HOME=/config \
    TRANSMISSION__RPC_PORT=9091 \
    TRANSMISSION_WEB_HOME=/app/web

#hadolint ignore=DL3018
RUN apk add --no-cache ca-certificates findutils geoip p7zip python3 \
    transmission-cli~"${VERSION}" \
    transmission-daemon~"${VERSION}"

#hadolint ignore=DL3059
RUN chown -R root:root /usr/bin/transmission* \
    && chmod -R 755 /usr/bin/transmission* \
    && ln -s /usr/bin/transmission-cli /app/transmission-cli \
    && ln -s /usr/bin/transmission-daemon /app/transmission-daemon \
    && curl -fsSL https://github.com/openscopeproject/TrguiNG/releases/download/${GUI_VERSION}/trguing-web-${GUI_VERSION}.zip -o /tmp/gui.zip \
    && unzip /tmp/gui.zip -d /app/web \
    # && chown -R kah:kah /app/web \
    && rm -rf /tmp/*

USER kah
COPY ./images/transmission/settings.json.tmpl /app/settings.json.tmpl
COPY ./images/transmission/entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://github.com/transmission/transmission"
