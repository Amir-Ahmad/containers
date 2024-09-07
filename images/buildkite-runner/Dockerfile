FROM public.ecr.aws/docker/library/alpine:3.20

ARG TARGETARCH
ARG OP_VERSION="v2.30.0"
ARG CRANE_VERSION="v0.20.2"

RUN apk add --no-cache \
    aws-cli \
    bash \
    curl \
    jq \
    yq \
    zip \
    unzip \
    git

RUN wget "https://cache.agilebits.com/dist/1P/op2/pkg/${OP_VERSION}/op_linux_${TARGETARCH}_${OP_VERSION}.zip" -O op.zip && \
    unzip -d op op.zip \
    && mv op/op /usr/local/bin/ \
    && rm -rf op.zip op \
    && case ${TARGETARCH} in \
    "amd64")  GCR_ARCH=x86_64 ;; \
    "arm64")  GCR_ARCH=arm64  ;; \
    esac \
    && curl -fL "https://github.com/google/go-containerregistry/releases/download/${CRANE_VERSION}/go-containerregistry_Linux_${GCR_ARCH}.tar.gz" \
        | tar xvz -C /usr/local/bin/ crane krane \
    && chmod +x /usr/local/bin/*

CMD ["/bin/bash"]
