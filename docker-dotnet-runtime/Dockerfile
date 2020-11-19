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
    && wget -O dotnet.tar.gz https://download.visualstudio.microsoft.com/download/pr/85c50e50-085c-46a6-a585-88aa13f4a1af/b04c24d8bc68449748509372a834f4c6/aspnetcore-runtime-3.1.9-linux-musl-x64.tar.gz \
    && dotnet_sha512='016dcf06ee019a3358c0431187a28cb184c352f14e3615e8d8cc5e47450ce964a33217f80b42eae0d90c9e6e3628585314a68fcae2ba191f49e258bb27a22907' \
    && echo "$dotnet_sha512  dotnet.tar.gz" | sha512sum -c - \
    && mkdir -p /usr/share/dotnet \
    && tar -C /usr/share/dotnet -xzf dotnet.tar.gz \
    && sudo ln -sf /usr/share/dotnet/dotnet /usr/bin/dotnet \
    && rm dotnet.tar.gz \
&& apk del .build-deps
