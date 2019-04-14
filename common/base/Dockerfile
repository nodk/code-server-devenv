ARG base_env_image
ARG vscode_image
FROM codercom/code-server AS cs

FROM ${vscode_image} AS ext

# Copy extensions info
COPY common/scripts/install-extensions.sh /tmp/
ARG lang_dir
COPY ${lang_dir}/extensions.txt /tmp/
COPY ${lang_dir}/vsixes /tmp/vsixes

# Install vscode extensions
RUN /tmp/install-extensions.sh /tmp/extensions.txt /tmp/vsixes

FROM ${base_env_image}

RUN adduser --gecos '' --disabled-password coder && gpasswd -a coder sudo

USER coder
# We create first instead of just using WORKDIR as when WORKDIR creates, the user is root.
RUN mkdir -p /home/coder/project
WORKDIR /home/coder/project

COPY --from=cs /usr/local/bin/code-server /usr/local/bin/code-server
RUN mkdir -p /home/coder/.local/share/code-server
COPY --from=ext --chown=coder:coder /tmp/.code-server/extensions /home/coder/.local/share/code-server/extensions
ARG lang_dir
COPY ${lang_dir}/settings.json /root/.code-server/User/settings.json

CMD ["code-server", "/home/coder/project"]
