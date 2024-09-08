FROM ghcr.io/buildkite/agent:3.80

ARG TARGETARCH
ARG OP_VERSION="v2.30.0"

RUN wget "https://cache.agilebits.com/dist/1P/op2/pkg/${OP_VERSION}/op_linux_${TARGETARCH}_${OP_VERSION}.zip" -O op.zip && \
    unzip -d op op.zip \
    && mv op/op /usr/local/bin/ \
    && rm -rf op.zip op
