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


VOLUME /hubdata

ONBUILD COPY requirements.txt requirements.txt
ONBUILD COPY local_requirements.txt local_requirements.txt

ONBUILD RUN set -eux; \
    pip install --disable-pip-version-check --no-cache-dir install -i https://mirrors.aliyun.com/pypi/simple/ \
    -r requirements.txt; \
    pip --disable-pip-version-check --no-cache-dir install -i https://package-reader:glpat-GxMbTBVPTAuyQyfyy4yH@gitlab.ish.org.cn/api/v4/projects/51/packages/pypi/simple \
    -r local_requirements.txt;

ONBUILD COPY . /usr/src/app/

WORKDIR /usr/src/app
