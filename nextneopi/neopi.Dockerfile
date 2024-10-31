FROM continuumio/miniconda3:22.11.1

RUN set -eux; \
    sed -i "s@//.*archive.ubuntu.com@//repo.huaweicloud.com@g" /etc/apt/sources.list; \
    sed -i "s@//.*security.ubuntu.com@//repo.huaweicloud.com@g" /etc/apt/sources.list; \
    apt-get update; \
    apt-get --allow-releaseinfo-change update && apt-get install -y \
        procps \
        curl \
        unzip \
        libgomp1 \
        openjdk-17-jdk;

    # set jdk-17 as default
RUN update-java-alternatives -s java-1.17.0-openjdk-amd64

RUN export LANG=C.UTF-8 LC_ALL=C.UTF-8;\
    export PATH=/opt/conda/bin:$PATH;\
    mkdir -p /opt/gatk; \
    mkdir -p /opt/conda/bin; \
    conda config --add channels defaults; \
    conda config --add channels bioconda; \
    conda config --add channels conda-forge;

RUN curl -L -o gatk-4.5.0.0.zip https://github.com/broadinstitute/gatk/releases/download/4.5.0.0/gatk-4.5.0.0.zip;\
    unzip -j gatk-4.5.0.0.zip gatk-4.5.0.0/gatkPythonPackageArchive.zip -d ./ ;\
    unzip -j gatk-4.5.0.0.zip gatk-4.5.0.0/gatk-package-4.5.0.0-local.jar -d ./opt/gatk/ ;\
    unzip -j gatk-4.5.0.0.zip gatk-4.5.0.0/gatk -d ./opt/gatk/ ;\
    chmod +x /opt/gatk/gatk ;\
    ln -s /opt/gatk/gatk /opt/conda/bin/gatk;

COPY .mambarc /root/.mambarc
COPY nextNEOpi.yml /nextNEOpi.yml

# RUN micromamba create --name base -f /nextNEOpi.yml -y -c conda-forge -c bioconda -c defaults

# RUN micromamba install --yes --name base --file /nextNEOpi.yml;\
RUN conda env update --file /nextNEOpi.yml;\
    rm -f /nextNEOpi.yml;\
    rm -f gatk-4.5.0.0.zip;\
    rm -f gatkPythonPackageArchive.zip;\
    apt-get clean;\
    conda clean --all --yes;\
    export LANG=C.UTF-8 LC_ALL=C.UTF-8;\
    export PATH=/usr/lib/jvm/java-17-openjdk-amd64/bin/:/opt/conda/bin:$PATH;
