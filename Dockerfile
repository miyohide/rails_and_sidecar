FROM node:18.14.1 as node
FROM ruby:3.2.1

ENV YARN_VERSION=1.22.19
RUN mkdir -p /opt

COPY --from=node /opt/yarn-v$YARN_VERSION /opt/yarn
COPY --from=node /usr/local/bin/node /usr/local/bin/
COPY --from=node /usr/local/lib/node_modules/ /usr/local/lib/node_modules/
RUN ln -s /opt/yarn/bin/yarn /usr/local/bin/yarn \
  && ln -s /opt/yarn/bin/yarn /usr/local/bin/yarnpkg \
  && ln -s /usr/local/bin/node /usr/local/bin/nodejs \
  && ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm \
  && ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npx

WORKDIR /app

RUN apt-get update && apt-get install -y \
      git \
      vim \
      sqlite3 \
      && rm -rf /var/lib/apt/lists/*
