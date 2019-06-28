# ARG sdkTag=2.1
# ARG image=mcr.microsoft.com/dotnet/core/sdk
## https://hub.docker.com/_/microsoft-dotnet-core-sdk/

ARG sdkTag
ARG image

# Build image
FROM ${image}:${sdkTag} as builder
LABEL version="2.0" maintainer="kdcllc <info@kingdavidconsulting.com>"

ARG NODE_VERSION=8.11.3

# Child container input arguments
# netcore21, netcore22, netcore30
# <TargetFramework>$(NetCoreTargetVersion)</TargetFramework>
ONBUILD ARG DOTNET_VERSION

# used for verbose restore.
ONBUILD ARG VERBOSE="false"

# enable or disable running of the tests.
ONBUILD ARG RUNTESTS="false"

# if PROJECT_PATH is present then only project is being restored and build.
ONBUILD ARG PROJECT_PATH

ONBUILD RUN  \
   if [ ! -z $DOTNET_VERSION ]; then \
      echo "\e[34m1.Using $DOTNET_VERSION\e[0m"; \
   else \
      echo "\e[34m1.Using Default TargetFramework(s) \e[0m"; \
   fi;

# default container update
RUN apt-get -y update &&\
    apt-get -y install wget gnupg2 &&\
    rm -rf /var/lib/apt/lists/* 

# NODE
ENV NODE_VERSION=v${NODE_VERSION}

RUN mkdir -p /nvm
ENV NVM_VERSION v0.34.0
ENV NVM_DIR /nvm

# Install nvm with node and npm
RUN curl https://raw.githubusercontent.com/creationix/nvm/$NVM_VERSION/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/versions/node/$NODE_VERSION/bin/
ENV PATH="${NODE_PATH}:${PATH}"

# confirm installation
RUN node -v && npm -v
# END NODE

WORKDIR /app

# Copy helper scripts
COPY ./scripts/* /scripts/
RUN chmod +x /scripts/*.sh

# copy build dependecies
ONBUILD RUN echo "\e[34m2.Copying solution and props/targets/dcproj files\e[0m"
ONBUILD COPY ./*.sln ./*.props ./*.targets ./*.dcproj ./
ONBUILD COPY ./build/* ./build/

# copy project files
ONBUILD RUN echo "\e[34m3.Copying all source .csproj files\e[0m"
ONBUILD COPY src/*/*.csproj ./
ONBUILD RUN for file in $(ls *.csproj); do mkdir -p src/${file%.*}/ && mv $file src/${file%.*}/; done

# copy test files
ONBUILD RUN echo "\e[34m4.Copying all test/* .csproj files\e[0m"
ONBUILD COPY test/*/*.csproj ./
ONBUILD RUN for file in $(ls *.csproj); do mkdir -p test/${file%.*}/ && mv $file test/${file%.*}/; done

# Debug
#ONBUILD  RUN ls; cd src; ls; cd aspnetapp.frontend; ls;
# restore project
ONBUILD RUN echo "\e[34m5.Restoring ./*.sln\e[0m"
ONBUILD RUN /scripts/restore.sh $VERBOSE $PROJECT_PATH

# build project
ONBUILD RUN echo "\e[34m6.Copy /src/ /src\e[0m"
ONBUILD COPY ./src ./src

ONBUILD RUN echo "\e[34m7.Copy /test/ /test\e[0m"
ONBUILD COPY ./test ./test

ONBUILD RUN echo "\e[34m8. Build ./*.sln\e[0m"

ONBUILD RUN /scripts/build.sh $VERBOSE [ -z $DOTNET_VERSION] $DOTNET_VERSION $PROJECT_PATH 

# run tests
ONBUILD RUN  \
   if [ "${RUNTESTS}" = "true" ]; then \
    echo "\e[31m--->Running Tests.\e[0m"; \
    find ./test -name '*.csproj' -print0 | xargs -L1 -0 dotnet test -c Release --logger:trx --results-directory /var/temp --no-build --no-restore; \
   fi;
