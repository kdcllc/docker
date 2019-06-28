# ARG sdkTag=2.1
# ARG image=mcr.microsoft.com/dotnet/core/sdk

ARG sdkTag
ARG image

# Build image
FROM ${image}:${sdkTag} as builder
LABEL version="2.0" maintainer="kdcllc <info@kingdavidconsulting.com>"

ARG nodeVersion=8.11.3

ONBUILD ARG coreversion
ONBUILD ARG framework
ONBUILD ARG verbose

ONBUILD RUN echo "\e[34m1.Using $coreversion $frameworkd\e[0m"

ENV NVM_VERSION 0.34.0
ENV NODE_VERSION=v${nodeVersion}

RUN apt-get -y update &&\
    apt-get -y install wget gnupg2 &&\
    rm -rf /var/lib/apt/lists/* 

# NODE
RUN mkdir -p /nvm

ENV NVM_DIR /nvm
ENV NVM_VERSION v0.34.0

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
ONBUILD RUN /scripts/restore.sh $verbose

# build project
ONBUILD RUN echo "\e[34m6.Copy /src/ /src\e[0m"
ONBUILD COPY ./src ./src

ONBUILD RUN echo "\e[34m7.Copy /test/ /test\e[0m"
ONBUILD COPY ./test ./test

ONBUILD RUN echo "\e[34m8. Build ./*.sln\e[0m"
ONBUILD RUN /scripts/build.sh $coreversion $framework


# run tests
ONBUILD RUN echo "\e[34m9. Run all of the test in ./test/* folder\e[0m"
ONBUILD RUN find ./test -name '*.csproj' -print0 | xargs -L1 -0 dotnet test -c Release --logger:trx --results-directory /var/temp --no-build --no-restore
