FROM swr.cn-east-3.myhuaweicloud.com/ish/pytorch:base

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        git git-lfs; \
    rm -rf /var/lib/apt/lists/*; \
    git config --global user.name "ci"; \
    git config --global user.email "ci@ish.org.cn"; \
    pip --disable-pip-version-check --no-cache-dir install -i https://repo.huaweicloud.com/repository/pypi/simple \
        pyyaml

COPY hub /usr/bin/hub

VOLUME /hubdata

ONBUILD COPY . /usr/src/app/

ONBUILD RUN set -eux; \
    pip install --disable-pip-version-check --no-cache-dir install -i https://mirrors.aliyun.com/pypi/simple/ \
    -r /usr/src/app/requirements.txt; \
    pip --disable-pip-version-check --no-cache-dir install -i https://package-reader:glpat-GxMbTBVPTAuyQyfyy4yH@gitlab.ish.org.cn/api/v4/projects/51/packages/pypi/simple \
    -r /usr/src/app/local_requirements.txt;

WORKDIR /usr/src/app
