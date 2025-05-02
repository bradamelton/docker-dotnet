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
    && wget -O dotnet.tar.gz https://builds.dotnet.microsoft.com/dotnet/Runtime/9.0.4/dotnet-runtime-9.0.4-linux-musl-x64.tar.gz \
    && dotnet_sha512='a5e597643deae25a998759bd9b0eb19b933f13a36b1d7f2e4696068a9a9e0324bfd43490e8dec222168b8c063b6827fbee80181e4700bb4712550acc1801048c' \
    && echo "$dotnet_sha512  dotnet.tar.gz" | sha512sum -c - \
    && mkdir -p /usr/share/dotnet \
    && tar -C /usr/share/dotnet -xzf dotnet.tar.gz \
    && sudo ln -sf /usr/share/dotnet/dotnet /usr/bin/dotnet \
    && rm dotnet.tar.gz \
&& apk del .build-deps
