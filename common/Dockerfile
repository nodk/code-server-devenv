ARG base_env_image
FROM codercom/code-server:1.939 AS cs

FROM ${base_env_image}

RUN set -x && \
    apt update && \
    apt install -y sudo&& \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

RUN adduser --gecos '' --disabled-password coder && \
	echo "coder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd

USER coder
# We create first instead of just using WORKDIR as when WORKDIR creates, the user is root.
RUN mkdir -p /home/coder/project && \
    chmod g+rw /home/coder/project;
WORKDIR /home/coder/project

COPY --from=cs /usr/local/bin/code-server /usr/local/bin/code-server

# Copy extensions info
COPY extensions.txt /tmp/
COPY vsixes /tmp/vsixes
# Install vscode extensions
RUN grep -v -e '^\s*#' -e '^\s*$' /tmp/extensions.txt | awk '{system("code-server --install-extension "$1)}' && \
    ls /tmp/vsixes/*.vsix | awk '{system("code-server --install-extension "$1)}'

COPY settings.json /home/coder/.local/share/code-server/User/settings.json

CMD ["code-server", "/home/coder/project"]
