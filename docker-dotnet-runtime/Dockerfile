FROM alpine:latest

RUN apk update
RUN apk add libstdc++
RUN apk add libgcc
RUN apk add libintl
RUN apk add icu
RUN apk add tzdata
RUN apk add sudo

ENV DOTNET_CLI_TELEMETRY_OPTOUT 1

RUN apk add --no-cache --virtual .build-deps \
    openssl \
    && wget -O dotnet.tar.gz https://download.visualstudio.microsoft.com/download/pr/56d9250f-97df-4786-b33e-a8e34b349e86/dcf054ca00899a70a80aa1a7d3072b52/dotnet-runtime-6.0.5-linux-x64.tar.gz \
    && dotnet_sha512='c228f0ba0ecc4ccda708e97529b248dd6d70f7f747ead6453623be77e8e1529b54db52f5df1b5e00b5b7f92b73389560832f80607fc07e50879d55ce905afcf7' \
    && echo "$dotnet_sha512  dotnet.tar.gz" | sha512sum -c - \
    && mkdir -p /usr/share/dotnet \
    && tar -C /usr/share/dotnet -xzf dotnet.tar.gz \
    && sudo ln -sf /usr/share/dotnet/dotnet /usr/bin/dotnet \
    && rm dotnet.tar.gz \
&& apk del .build-deps
