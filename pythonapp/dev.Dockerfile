FROM swr.cn-east-3.myhuaweicloud.com/ish/pythonapp:base

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        openssh-server sudo \
        curl wget ca-certificates \
        vim git build-essential; \
    rm -rf /var/lib/apt/lists/*; \
    ssh-keygen -A; \
    sed -i -E "s/#?\s*UsePAM\s+.+/UsePAM yes/g" /etc/ssh/sshd_config; \
    sed -i -E "s/#?\s*PasswordAuthentication\s+.+/PasswordAuthentication yes/g" /etc/ssh/sshd_config; \
    mkdir /run/sshd;


RUN set -eux; \
    useradd -s /bin/bash --uid 1001 -U -m dev; \
    echo "dev:dev" | chpasswd; \
    usermod -aG sudo dev;

WORKDIR /home/dev
