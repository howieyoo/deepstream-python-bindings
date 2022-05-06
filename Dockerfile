FROM ubuntu:focal

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        bash \
        ca-certificates \
        cmake \
        g++ \
        git \
        libgstreamer-plugins-base1.0-dev \
        libgstreamer1.0-dev \
        make \
        python3-setuptools \
        python3-wheel \
        python3.8 \
        python3.8-dev

ADD deepstream_sdk_v6.0.1_x86_64.tbz2 /

WORKDIR /root
ENTRYPOINT [ "/bin/bash" ]
