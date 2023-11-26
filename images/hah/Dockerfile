FROM quay.io/curl/curl:8.4.0 as builder

ARG VERSION

RUN mkdir -p /tmp/dl \
    && curl -fsSL https://github.com/danielskowronski/hetzner-auction-hunter/archive/${VERSION}.tar.gz \
    | tar xzvf - -C /tmp/dl --strip-components=1

FROM python:3.10-slim-buster

ARG UID=568

COPY --from=builder /tmp/dl/requirements.txt /tmp/requirements.txt

RUN python3 -m pip install --no-cache-dir -r /tmp/requirements.txt \
    && rm /tmp/requirements.txt \
    && adduser kah \
    --group \
    --uid ${UID} \
    --system \
    --no-create-home \
    --disabled-password

WORKDIR /app
USER kah

COPY --from=builder /tmp/dl/hah.py /app/hah.py

ENTRYPOINT [ "python", "/app/hah.py" ]

LABEL org.opencontainers.image.source="https://github.com/danielskowronski/hetzner-auction-hunter"
