FROM cgr.dev/chainguard/wolfi-base:latest AS base

RUN apk add --no-cache coreutils rsync ca-certificates

USER nonroot

CMD ["rsync", "--help"]
