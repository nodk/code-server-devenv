#!/bin/sh

grep -v -e '^\s*#' -e '^\s*$' $1 | awk '{system("code --user-data-dir --extensions-dir /tmp/.code-server/extensions --install-extension "$1)}'
if [ -e "$2" ] && [ -d "$2" ]; then
  ls $2/*.vsix | awk '{system("code --user-data-dir --extensions-dir /tmp/.code-server/extensions --install-extension "$1)}'
fi