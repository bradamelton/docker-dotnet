FROM alpine:latest

RUN apk add libstdc++
RUN apk add libgcc
RUN apk add libintl
RUN apk add icu

ENV DOTNET_CLI_TELEMETRY_OPTOUT 1

RUN apk add --no-cache --virtual .build-deps \
        openssl \
    && wget -O dotnet.tar.gz https://download.visualstudio.microsoft.com/download/pr/f7c8f82a-8c47-497d-875b-2ac210599ec5/e8aea0c195efed8a9aff2ba687db8c26/aspnetcore-runtime-3.1.8-linux-x64.tar.gz \
    && dotnet_sha512='dc332c14a6b0362becf8c8bbb1e3cc6a93bad1ea9c883602fdba35b53b3bf8078ede079c5918723add03ccebee46165d7f6d1ee4fdc1e04f29257a8155e33622' \
    && echo "$dotnet_sha512  dotnet.tar.gz" | sha512sum -c - \
    && mkdir -p /usr/share/dotnet \
    && tar -C /usr/share/dotnet -xzf dotnet.tar.gz \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet \
    && rm dotnet.tar.gz \
&& apk del .build-deps