FROM continuumio/miniconda3:22.11.1

COPY .mambarc /root/.mambarc

RUN export LANG=C.UTF-8 LC_ALL=C.UTF-8; \
    export PATH=/opt/conda/bin:$PATH; \
    conda config --add channels defaults; \
    conda config --add channels bioconda; \
    conda config --add channels conda-forge;

RUN conda install manta=1.6.0
