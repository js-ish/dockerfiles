FROM nvidia/cuda:12.2.2-devel-ubuntu20.04

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        python3-dev \
        python3-pip \
        python-is-python3 \
        python3-mysqldb \
    ; \
    rm -rf /var/lib/apt/lists/*

RUN pip install --disable-pip-version-check --no-cache-dir \
       torch==2.1.0 torchvision==0.16 torchaudio==2.1.0 torchtext==0.16.0; \
    pip install --disable-pip-version-check --no-cache-dir \
       Pillow scikit-learn pyyaml
