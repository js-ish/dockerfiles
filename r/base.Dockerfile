FROM rocker/tidyverse:4.2.2

RUN set -eux; \
    sed -i "s@//.*archive.ubuntu.com@//repo.huaweicloud.com@g" /etc/apt/sources.list; \
    sed -i "s@//.*security.ubuntu.com@//repo.huaweicloud.com@g" /etc/apt/sources.list; \
    apt-get update;  \
    apt-get install -y --no-install-recommends \
        libpng-dev \
        libcairo2-dev \
        libxt-dev \
        libxml2 \
        libxml2-dev \
        libgit2-dev \
    ; \
    rm -rf /var/lib/apt/lists/*;

RUN install2.r --error stringi && R -e 'BiocManager::install("ComplexHeatmap")' && install2.r --error \
    openxlsx \
    data.table \
    devtools \
    RColorBrewer \
    patchwork \
    ggpubr \
    DT \
    base64enc
