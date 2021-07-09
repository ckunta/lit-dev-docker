# litelement requires node.js >10
ARG VERSION=16.3.0
ARG SHA256=sha256
#check this with docker pull node
ARG HASH=e36cf1bb8719551220ba8c3ee1583881e79ad040803570e0849b00b8fe009153
FROM node:${VERSION}@${SHA256}:${HASH}

#only use this if it's necessary
#FROM node:latest

LABEL "maintainer"="23427639+ckunta@users.noreply.github.com"

USER root

EXPOSE 8000

RUN apt-get update \
    && apt-get install --quiet --assume-yes  vim \
    && apt-get clean

RUN apt-get update \
    && apt-get install --quiet --assume-yes  emacs \
    && apt-get clean

RUN groupadd -r app \
    && useradd -r -g app -s /bin/bash kunta \
    && mkdir /home/kunta \
    && chown kunta:app /home/kunta

WORKDIR /home/kunta
USER kunta:app
COPY --chown=kunta:app .bashrc /home/kunta
COPY --chown=kunta:app emacs.d.tar /home/kunta/
RUN tar xvf emacs.d.tar
ENV PATH="${PATH}:/home/kunta/node_modules/.bin"
ENV TERM="xterm"

# setting up the development environment
RUN npm install --save-dev @web/dev-server \
    && npm install --save-dev @web/dev-server-legacy \
    && npm install --save-dev @web/dev-server-esbuild \
    && npm install --save-dev typescript \
    && npm install --save-dev eslint \
    && npm install --save-dev lit \
    && npm install --save-dev lit-analyzer \
    && npm install --save-dev ts-lit-plugin


# sample project's source code
#COPY --chown=kunta:app lit-element-starter-ts-master.zip /home/node
#COPY --chown=kunta:app lit-playground.tar /home/node


#RUN unzip lit-element-starter-ts-master.zip \
#    && rm lit-element-starter-ts-master.zip \
#    && cd lit-element-starter-ts-master \
#   && npm install

# the starter is using an older version of @web/dev-server
# npm audit fix

# next is to run the server from the home directory
# npm run serve

