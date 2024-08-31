FROM public.ecr.aws/docker/library/alpine:3.20

ARG TARGETARCH
ARG OP_VERSION="v2.30.0"

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

RUN wget "https://cache.agilebits.com/dist/1P/op2/pkg/${OP_VERSION}/op_linux_${TARGETARCH}_${OP_VERSION}.zip" -O op.zip && \
    unzip -d op op.zip \
    && mv op/op /usr/local/bin/ \
    && chmod +x /usr/local/bin/op \
    && rm -rf op.zip op

CMD ["/bin/bash"]
