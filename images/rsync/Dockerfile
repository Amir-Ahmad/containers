FROM cgr.dev/chainguard/wolfi-base:latest AS base

RUN apk add --no-cache coreutils openssh-client rsync ca-certificates

USER nonroot

CMD ["rsync", "--help"]
