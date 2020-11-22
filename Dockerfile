# vi: ft=dockerfile
FROM alpine

RUN apk add --no-cache --update \
        bash \
        bind-tools \
        binutils \
        busybox-extras \
        ca-certificates \
        coreutils \
        curl \
        findutils \
        gawk \
        git \
        jq \
        tar \
        postgresql-client \
        netcat-openbsd \
        tcpdump \
        tree \
        wget \
        xz \
    && ln -sf /bin/bash /bin/sh \
    && rm -rf /var/cache/apk/*

ENV GLIBC_VERSION "2.32-r0"
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk && \
    apk add glibc-${GLIBC_VERSION}.apk && \
    rm -f glibc-${GLIBC_VERSION}.apk

SHELL ["/bin/bash", "-e", "-o", "pipefail", "-c"]

ENTRYPOINT ["tail", "-f", "/dev/null"]
