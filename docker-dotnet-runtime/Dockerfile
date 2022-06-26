FROM alpine:3.15

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
    && wget -O dotnet.tar.gz https://download.visualstudio.microsoft.com/download/pr/58737b13-a9b4-4ebf-a360-6b8909842ba6/0856279338ab22a3efbdf387068ebfac/aspnetcore-runtime-6.0.6-linux-musl-x64.tar.gz \
    && dotnet_sha512='0ecaf750ecf0eb1da601baed2c71a7a09994fe82ef11c4896c57e07d480e5820fb9f92b5fe55e35bf72f067894b85d7d33d3955f15b670d4282ec5049e52f124' \
    && echo "$dotnet_sha512  dotnet.tar.gz" | sha512sum -c - \
    && mkdir -p /usr/share/dotnet \
    && tar -C /usr/share/dotnet -xzf dotnet.tar.gz \
    && sudo ln -sf /usr/share/dotnet/dotnet /usr/bin/dotnet \
    && rm dotnet.tar.gz \
&& apk del .build-deps
