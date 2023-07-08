FROM atlassian/pipelines-kubectl:1.24.2

ARG HELM_VERSION=3.3.1

ENV BASE_URL="https://get.helm.sh"
ENV TAR_FILE="helm-v${HELM_VERSION}-linux-amd64.tar.gz"

RUN set -eux; \
    apk add --update --no-cache git; \
    apk add --update --no-cache -t deps curl; \
    curl -sL ${BASE_URL}/${TAR_FILE} | tar -xvz; \
    mv linux-amd64/helm /usr/bin/helm; \
    chmod +x /usr/bin/helm; \
    rm -rf linux-amd64; \
    apk del --purge deps; \
    helm repo add gitlab https://charts.gitlab.io; \
    helm repo add harbor https://helm.goharbor.io; \
    helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx; \
    helm repo update;
