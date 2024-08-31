FROM public.ecr.aws/docker/library/alpine:3.20

ARG TARGETARCH

RUN apk add --no-cache \
    aws-cli \
    bash \
    curl \
    jq \
    yq \
    crane \
    zip \
    unzip \
    git

RUN echo https://downloads.1password.com/linux/alpinelinux/stable/ >> /etc/apk/repositories \
    && wget https://downloads.1password.com/linux/keys/alpinelinux/support@1password.com-61ddfc31.rsa.pub -P /etc/apk/keys \
    && apk update && apk add --no-cache 1password-cli

CMD ["/bin/bash"]
