ARG sdkTag=2.1-sdk
ARG runtimeTag=2.1-aspnetcore-runtime
ARG coreversion=netcore22
ARG image=microsoft/dotnet

# Build image
FROM ${image}:${sdkTag} as builder
LABEL version="1.0" maintainer="kdcllc <info@kingdavidconsulting.com>"

# NODE
ENV NODE_VERSION 8.11.3
ENV NODE_DOWNLOAD_URL https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz
# https://nodejs.org/download/release/v8.11.3/SHASUMS256.txt
ENV NODE_DOWNLOAD_SHA 1ea408e9a467ed4571730e160993f67a100e8c347f6f9891c9a83350df2bf2be

RUN curl -SL "$NODE_DOWNLOAD_URL" --output nodejs.tar.gz \
   && echo "$NODE_DOWNLOAD_SHA nodejs.tar.gz" | sha256sum -c - \
   && tar -xzf "nodejs.tar.gz" -C /usr/local --strip-components=1 \
   && rm nodejs.tar.gz \
   && ln -s /usr/local/bin/node /usr/local/bin/nodejs
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

# restore project
ONBUILD RUN dotnet restore  *.sln -nowarn:msb3202,nu1503

# build project
ONBUILD COPY ./src ./src
ONBUILD COPY ./test ./test
ONBUILD RUN dotnet build  *.sln  -p:NetCoreVersion=${coreversion} -c Release --no-restore

# run tests
ONBUILD RUN find ./test -name '*.csproj' -print0 | xargs -L1 -0 dotnet test -c Release --logger trx --results-directory /var/temp --no-build --no-restore
