FROM ubuntu:18.04

RUN set -x && \
    apt update && \
    apt install -y wget gnupg

RUN set -x && \
    wget -O /root/gpg.key https://apt.llvm.org/llvm-snapshot.gpg.key && \
    apt-key add /root/gpg.key && \
    rm /root/gpg.key

RUN set -x && \
    apt update && \
    apt install -y clang-7 lldb-7 lld-7 ninja-build&& \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/clang-7 /usr/bin/clang && \
    ln -s /usr/bin/clang++-7 /usr/bin/clang++