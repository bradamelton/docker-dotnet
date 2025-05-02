FROM alpine:3.15

RUN apk update
RUN apk upgrade 
RUN apk add libstdc++
RUN apk add libintl
RUN apk add icu
RUN apk add tzdata
RUN apk add bash 

ENV DOTNET_CLI_TELEMETRY_OPTOUT 1


# version 9
RUN apk add --no-cache --virtual .build-deps \
        openssl \
    && wget -O dotnet.tar.gz https://builds.dotnet.microsoft.com/dotnet/Sdk/9.0.203/dotnet-sdk-9.0.203-linux-musl-x64.tar.gz \
    && dotnet_sha512='83b0c47dca699b57c5c7b51d33fad61eb74bdf4285a992befe8d5ff8ea35c0f241225ff2fda709816b66462945ebaead6ea4ef2fbfb28f6194468916ce608d1e' \
    && echo "$dotnet_sha512  dotnet.tar.gz" | sha512sum -c -
RUN mkdir -p /usr/share/dotnet
RUN tar -C /usr/share/dotnet -xzf dotnet.tar.gz
RUN ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet
RUN rm dotnet.tar.gz 

COPY docker-entrypoint.sh /bin/
RUN chmod 775 /bin/docker-entrypoint.sh
ENTRYPOINT ["/bin/docker-entrypoint.sh"]
