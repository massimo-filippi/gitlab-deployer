FROM ubuntu

LABEL maintainer="Massimo Filippi"

# Install basic stuff
RUN apt-get update --fix-missing \
    && apt-get -y upgrade \
    && apt-get install -y \
        sudo \
        apt-utils \
        curl \
        wget \
        openssh-client \
        gnupg \
        unzip

# Install Node, NPM, Firebase tools & Google Lighthouse
# Cache bust so we always get the latest version of LH when building the image.
# ToDo
# - Install more versions & add version manager / switcher
ARG CACHEBUST=1
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt-get update \
    && apt-get install -y nodejs \
    && npm install -g firebase-tools \
    && npm install -g lighthouse
