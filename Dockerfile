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

# Install Node, NPM
# ToDo
# - Install more versions & add version manager / switcher
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get update \
    && apt-get install -y nodejs
