FROM python:3.10-bullseye

RUN pip install --disable-pip-version-check --no-cache-dir \
        torch==2.1.2 torchvision==0.16.2 torchaudio==2.1.2 --index-url https://download.pytorch.org/whl/cu121; \
    pip install --disable-pip-version-check --no-cache-dir \
        Pillow scikit-learn pyyaml
