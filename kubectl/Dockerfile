FROM atlassian/pipelines-kubectl:1.24.2

RUN set -eux; \
    sed -i "s@dl-cdn.alpinelinux.org/@repo.huaweicloud.com/@g" /etc/apk/repositories; \
    apk add --update --no-cache openssl yq curl;


COPY kubeapply /usr/bin/
