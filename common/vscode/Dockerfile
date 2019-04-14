FROM ubuntu:18.04

ADD https://go.microsoft.com/fwlink/?LinkID=760868 code.deb

RUN apt-get update && apt-get -y install \
    --no-install-recommends \
    ./code.deb \
    libgtk2.0-0 \
    libx11-xcb1 \
    libxtst6 \
    libxss1 \
    libasound2 \
    git \
    openssh-server \
    xauth \
    ttf-ubuntu-font-family \
    sudo \
 && rm -rf code.deb \
 && rm -rf /var/lib/apt/lists/*