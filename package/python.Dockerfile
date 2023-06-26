FROM python:3.10-bullseye


RUN set -eux; \
    sed -i "s@http://deb.debian.org@https://repo.huaweicloud.com@g" /etc/apt/sources.list; \
    sed -i "s@http://security.debian.org@https://repo.huaweicloud.com@g" /etc/apt/sources.list; \
    pip --disable-pip-version-check --no-cache-dir install twine -i https://mirrors.aliyun.com/pypi/simple/;
