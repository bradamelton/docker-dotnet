FROM alpine:latest

RUN apk add libstdc++
RUN apk add libintl
RUN apk add icu

ENV DOTNET_VERSION 2.2.106
ENV DOTNET_CLI_TELEMETRY_OPTOUT 1

RUN apk add --no-cache --virtual .build-deps \
        openssl \
    && wget -O dotnet.tar.gz https://dotnetcli.blob.core.windows.net/dotnet/Sdk/$DOTNET_VERSION/dotnet-sdk-$DOTNET_VERSION-linux-musl-x64.tar.gz \
    && dotnet_sha512='c02a34f8aea4de56f536ad365e10112857c8813abc043e688816569ac72154fe58d21c35836d00cbe6d44a0fe3e4515dac4e67326648f42c95d19bb73817f8ee' \
    && echo "$dotnet_sha512  dotnet.tar.gz" | sha512sum -c - \
    && mkdir -p /usr/share/dotnet \
    && tar -C /usr/share/dotnet -xzf dotnet.tar.gz \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet \
    && rm dotnet.tar.gz \
&& apk del .build-deps

RUN dotnet help