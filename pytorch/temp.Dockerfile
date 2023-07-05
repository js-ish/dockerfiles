FROM nvidia/cuda:11.6.2-devel-ubuntu20.04

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


RUN pip install --disable-pip-version-check --no-cache-dir --extra-index-url https://download.pytorch.org/whl/cu116 \
    torch==1.13.1+cu116 torchvision==0.14.1+cu116; \
    pip install --disable-pip-version-check --no-cache-dir \
    torchaudio==0.13.1 torchtext==0.14.1 Pillow scikit-learn
