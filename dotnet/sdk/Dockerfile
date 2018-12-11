ARG sdkTag=2.1-sdk
ARG runtimeTag=2.1-aspnetcore-runtime
ARG coreversion=netcore22
ARG image=microsoft/dotnet

# Build image
FROM ${image}:${sdkTag} as builder
LABEL version="1.0" maintainer="kdcllc <info@kingdavidconsulting.com>"

ARG nodeVersion=8.11.3

RUN apt-get -y update &&\
    apt-get -y install wget gnupg2 \
     && rm -rf /var/lib/apt/lists/*
# NODE
# set some environment variables that we'll use
# a little further down to install NVM and Node
ENV NVM_DIR /usr/local/nvm
# install script comes from https://engineering.circle.com/productive-with-docker-in-20-minutes-8997297a35bb, newer version on nvm script doesn't want to work.
ENV NVM_VERSION 0.31.2
ENV NODE_VERSION=${nodeVersion}

# install nvm for easier nodejs version management
# https://github.com/creationix/nvm#install-script
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v$NVM_VERSION/install.sh | bash

# install node and npm
RUN . $NVM_DIR/nvm.sh && \
    nvm install $NODE_VERSION && \
    nvm alias default $NODE_VERSION && \
    nvm use default

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# confirm installation
RUN node -v
RUN npm -v
# END NODE

WORKDIR /app

# copy build dependecies
ONBUILD COPY ./*.sln  ./
ONBUILD COPY ./*.dcproj ./
ONBUILD COPY build/* build/
ONBUILD COPY Directory.Build.props ./

# copy project files
ONBUILD COPY src/*/*.csproj ./
ONBUILD RUN for file in $(ls *.csproj); do mkdir -p src/${file%.*}/ && mv $file src/${file%.*}/; done

# copy test files
ONBUILD COPY test/*/*.csproj ./
ONBUILD RUN for file in $(ls *.csproj); do mkdir -p test/${file%.*}/ && mv $file test/${file%.*}/; done

# Debug
#ONBUILD  RUN ls; cd src; ls; cd aspnetapp.frontend; ls;
# restore project
ONBUILD RUN dotnet restore ./*.sln --force -v n

# build project
ONBUILD COPY ./src ./src
ONBUILD COPY ./test ./test
ONBUILD RUN dotnet build  ./*.sln -p:NetCoreVersion=${coreversion} -c Release

# run tests
ONBUILD RUN find ./test -name '*.csproj' -print0 | xargs -L1 -0 dotnet test -c Release --logger trx --results-directory /var/temp --no-build --no-restore
