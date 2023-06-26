FROM swr.cn-east-3.myhuaweicloud.com/ish/pytorch:base

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

COPY envlist /tmp/

RUN bash -c 'for line in $(cat /tmp/envlist); do printf "export %s=\"%s\"\n" "$line" "${!line}" | tee -a /etc/profile.d/02-envs.sh; done'

RUN set -eux; \
    useradd -s /bin/bash --uid 1001 -U -m dev; \
    echo "dev:dev" | chpasswd; \
    usermod -aG sudo dev;

WORKDIR /home/dev
