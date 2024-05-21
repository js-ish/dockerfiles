FROM nvidia/cuda:12.2.2-devel-ubuntu22.04

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        python3-dev \
        python3-pip \
        python-is-python3 \
    ; \
    rm -rf /var/lib/apt/lists/*

RUN pip install --disable-pip-version-check --no-cache-dir \
        torch==2.1.2 torchvision==0.16.2 torchaudio==2.1.2 --index-url https://download.pytorch.org/whl/cu121; \
    pip install --disable-pip-version-check --no-cache-dir \
        Pillow scikit-learn pyyaml
