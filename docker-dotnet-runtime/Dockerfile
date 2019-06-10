FROM alpine:latest

RUN apk update
RUN apk add libstdc++
RUN apk add libgcc
RUN apk add libintl
RUN apk add icu

ENV DOTNET_VERSION 2.2.4
ENV DOTNET_CLI_TELEMETRY_OPTOUT 1

RUN apk add --no-cache --virtual .build-deps \
        openssl \
    && wget -O dotnet.tar.gz https://dotnetcli.blob.core.windows.net/dotnet/Runtime/$DOTNET_VERSION/dotnet-runtime-$DOTNET_VERSION-linux-musl-x64.tar.gz \
    && dotnet_sha512='97fed0c8751a4d6c596d49764fcf38f9f3add7456c5a311c6fd9530a8540b1fd52970f4ca0e8cea34ffe8cc8059c85473281a499a797ddf18773380c92f092ca' \
    && echo "$dotnet_sha512  dotnet.tar.gz" | sha512sum -c - \
    && mkdir -p /usr/share/dotnet \
    && tar -C /usr/share/dotnet -xzf dotnet.tar.gz \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet \
    && rm dotnet.tar.gz 
