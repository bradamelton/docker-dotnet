FROM alpine:latest

RUN apk add libstdc++
RUN apk add libintl
RUN apk add icu

ENV DOTNET_VERSION 2.2.106
ENV DOTNET_CLI_TELEMETRY_OPTOUT 1



RUN apk add --no-cache --virtual .build-deps \
        openssl \
    && wget -O dotnet.tar.gz https://download.visualstudio.microsoft.com/download/pr/e301fc5c-c8dd-4f8e-94ee-d19f3caf508f/a4191801aeb8cd813cf7057ac4d936a0/dotnet-sdk-3.1.402-linux-musl-x64.tar.gz \
    && dotnet_sha512='30916407ee1f99c0f1398a45aa1a480b6d75c5e42488c877b7879ea68a03de07b29943e89e9324c3b14df4ca1d2723116a5c4812b2265cbb103488706aa56b70' \
    && echo "$dotnet_sha512  dotnet.tar.gz" | sha512sum -c - \
    && mkdir -p /usr/share/dotnet \
    && tar -C /usr/share/dotnet -xzf dotnet.tar.gz \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet \
    && rm dotnet.tar.gz \
&& apk del .build-deps

RUN dotnet help