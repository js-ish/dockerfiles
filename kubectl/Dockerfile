FROM atlassian/pipelines-kubectl:1.24.2

RUN set -eux; \
    apk add --update --no-cache openssl yq curl;


COPY kubeapply /usr/bin/
