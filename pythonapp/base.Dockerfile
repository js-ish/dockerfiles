FROM python:3.10-bullseye

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        libmariadb-dev \
    ; \
    rm -rf /var/lib/apt/lists/*; \
    pip --disable-pip-version-check --no-cache-dir install \
        mysqlclient \
    ;
