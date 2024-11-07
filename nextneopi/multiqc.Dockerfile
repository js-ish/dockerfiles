FROM continuumio/miniconda3:22.11.1

RUN set -eux; \
    sed -i "s@//.*archive.ubuntu.com@//repo.huaweicloud.com@g" /etc/apt/sources.list; \
    sed -i "s@//.*security.ubuntu.com@//repo.huaweicloud.com@g" /etc/apt/sources.list;

COPY .mambarc /root/.mambarc

RUN export LANG=C.UTF-8 LC_ALL=C.UTF-8; \
    export PATH=/opt/conda/bin:$PATH; \
    conda config --add channels defaults; \
    conda config --add channels bioconda; \
    conda config --add channels conda-forge;

RUN conda install multiqc=1.21
