code-server-devenv
====
Dockerfile assets for various language environment with [code-server](https://github.com/codercom/code-server).

## Description

Inspired by [code-server-env](https://github.com/Mushus/code-server-env).

Add some workarounds for more flexibility.

## Quick Start

PYTHON EXAMPLE

1. Go to `env-sample/python`.
2. Make a `.env` file from `.env-sample`, fill blanks.
3. `docker-compose up` and access `https://localhost:8443`
4. Python environment with some extensions there.

## Make your own development environment

1. Copy from `env-sample/`.
2. Write `Dockerfile` for the container contains the language you desired.
3. Edit `extensions.txt`, add extension ID you want to use.
   1. or put `.visx` files in `./vsixes`.
4. Edit `docker-compose.yml`, `.env` and `settings.json` file.

