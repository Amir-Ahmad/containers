FROM public.ecr.aws/docker/library/alpine:3.18

ARG TARGETARCH

ARG CUE_VERSION="v0.6.0"
ARG KUSTOMIZE_VERSION="v5.2.1"
ARG HELM_VERSION="v3.13.2"
ARG SOPS_VERSION="v3.8.1"

RUN apk add --no-cache bash git

RUN wget -qO /usr/local/bin/sops https://github.com/mozilla/sops/releases/download/${SOPS_VERSION}/sops-${SOPS_VERSION}.linux.${TARGETARCH} \
    && wget -qO- https://github.com/cue-lang/cue/releases/download/${CUE_VERSION}/cue_${CUE_VERSION}_linux_${TARGETARCH}.tar.gz \
    | tar xvz cue -C /usr/local/bin/ \
    && wget -qO- https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2F${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_linux_${TARGETARCH}.tar.gz \
    | tar xvz kustomize -C /usr/local/bin/ \
    && wget -qO- https://get.helm.sh/helm-${HELM_VERSION}-linux-${TARGETARCH}.tar.gz \
    | tar xvz linux-${TARGETARCH}/helm -C /usr/local/bin/ --strip-components=1 \
    && chmod 755 /usr/local/bin/*

LABEL cue.version="${CUE_VERSION}"
LABEL kustomize.version="${KUSTOMIZE_VERSION}"
LABEL helm.version="${HELM_VERSION}"
LABEL sops.version="${SOPS_VERSION}"
