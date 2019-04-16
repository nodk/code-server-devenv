ARG base_env_image
ARG vscode_image
FROM codercom/code-server AS cs

FROM ${vscode_image} AS ext

# Copy extensions info
COPY extensions.txt /tmp/
COPY vsixes /tmp/vsixes

# Install vscode extensions
RUN grep -v -e '^\s*#' -e '^\s*$' /tmp/extensions.txt | awk '{system("code --user-data-dir --extensions-dir /tmp/.code-server/extensions --install-extension "$1)}' && \
    ls /tmp/vsixes/*.vsix | awk '{system("code --user-data-dir --extensions-dir /tmp/.code-server/extensions --install-extension "$1)}'

FROM ${base_env_image}

RUN adduser --gecos '' --disabled-password coder && gpasswd -a coder sudo

USER coder
# We create first instead of just using WORKDIR as when WORKDIR creates, the user is root.
RUN mkdir -p /home/coder/project
WORKDIR /home/coder/project

COPY --from=cs /usr/local/bin/code-server /usr/local/bin/code-server
RUN mkdir -p /home/coder/.local/share/code-server
COPY --from=ext --chown=coder:coder /tmp/.code-server/extensions /home/coder/.local/share/code-server/extensions
COPY settings.json /home/coder/.local/share/code-server/settings.json

CMD ["code-server", "/home/coder/project"]
