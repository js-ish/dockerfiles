FROM python:3.10-alpine

RUN set -eux; \
    sed -i "s@dl-cdn.alpinelinux.org@repo.huaweicloud.com@g" /etc/apk/repositories; \
    apk add --no-cache --virtual .build-deps mariadb-dev build-base; \
    pip --disable-pip-version-check --no-cache-dir install -i https://repo.huaweicloud.com/repository/pypi/simple \
        mysqlclient \
    ; \
    apk add --no-cache --virtual .runtime-deps mariadb-connector-c mariadb-connector-c-dev; \
    apk del .build-deps; \
    apk add --no-cache libc-dev gcc g++;

RUN mkdir /usr/src/app

ONBUILD COPY requirements.txt requirements.txt
ONBUILD COPY local_requirements.txt local_requirements.txt

ONBUILD RUN set -eux; \
    pip --disable-pip-version-check --no-cache-dir install -i https://mirrors.aliyun.com/pypi/simple/ \
    -r requirements.txt; \
    pip --disable-pip-version-check --no-cache-dir install -i https://package-reader:glpat-GxMbTBVPTAuyQyfyy4yH@gitlab.ish.org.cn/api/v4/projects/51/packages/pypi/simple \
    -r local_requirements.txt;

ONBUILD COPY . /usr/src/app/

WORKDIR /usr/src/app
