FROM python:3.10-bullseye

RUN set -eux; \
    sed -i "s@http://deb.debian.org@https://repo.huaweicloud.com@g" /etc/apt/sources.list; \
    sed -i "s@http://security.debian.org@https://repo.huaweicloud.com@g" /etc/apt/sources.list; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        libmariadb-dev \
    ; \
    rm -rf /var/lib/apt/lists/*; \
    pip --disable-pip-version-check --no-cache-dir install -i https://repo.huaweicloud.com/repository/pypi/simple \
        mysqlclient \
    ;
