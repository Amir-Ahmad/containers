FROM cgr.dev/chainguard/wolfi-base:latest AS base

ARG PYTHON_VERSION=3.12
ARG YAMTRACK_VERSION=0.24.11

RUN apk add --no-cache python-${PYTHON_VERSION}

FROM base AS builder

RUN apk add --no-cache py${PYTHON_VERSION}-pip curl

USER nonroot

WORKDIR /app

RUN curl -fsSL https://github.com/FuzzyGrim/Yamtrack/archive/refs/tags/v${YAMTRACK_VERSION}.tar.gz \
    | tar xvz -C /tmp/ --strip-components=1 Yamtrack-${YAMTRACK_VERSION}/requirements.txt Yamtrack-${YAMTRACK_VERSION}/src \
    && mv /tmp/src/* . \
    && pip install --no-cache-dir --user -r /tmp/requirements.txt

FROM base AS final

ENV PYTHONUNBUFFERED=1
ENV PATH=/home/nonroot/.local/bin:$PATH

USER nonroot

WORKDIR /app

COPY --from=builder /home/nonroot/.local /home/nonroot/.local
COPY --from=builder /app /app

ENTRYPOINT ["gunicorn", "--bind", "0.0.0.0:8001", "--preload", "config.wsgi:application", "--timeout", "200", "--max-requests", "500", "--max-requests-jitter", "10"]

EXPOSE 8001
