FROM elixir:1.8.1

RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION} | bash \
  && apt-get install -y nodejs

RUN npm install npm@latest -g

RUN mix local.hex --force && \
  mix archive.install hex phx_new 1.4.3 --force && \
  mix local.rebar --force
