FROM python:3.10-bullseye


RUN set -eux; \
    pip --disable-pip-version-check --no-cache-dir install twine
