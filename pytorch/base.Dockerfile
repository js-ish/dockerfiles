FROM nvidia/cuda:11.7.1-devel-ubuntu22.04

RUN set -eux; \
    sed -i "s@//.*archive.ubuntu.com@//repo.huaweicloud.com@g" /etc/apt/sources.list; \
    sed -i "s@//.*security.ubuntu.com@//repo.huaweicloud.com@g" /etc/apt/sources.list; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        python3-dev \
        python3-pip \
        python-is-python3 \
    ; \
    rm -rf /var/lib/apt/lists/*

RUN pip install --disable-pip-version-check --no-cache-dir \
    torch torchvision torchaudio torchtext Pillow scikit-learn
