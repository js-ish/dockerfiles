FROM node:18-bullseye

RUN set -eux; \
    sed -i "s@http://deb.debian.org@https://repo.huaweicloud.com@g" /etc/apt/sources.list; \
    sed -i "s@http://security.debian.org@https://repo.huaweicloud.com@g" /etc/apt/sources.list; \
    corepack enable
