FROM alpine:3.15

RUN apk update
RUN apk upgrade 
RUN apk add libstdc++
RUN apk add libintl
RUN apk add icu
RUN apk add tzdata
RUN apk add bash 

ENV DOTNET_CLI_TELEMETRY_OPTOUT 1

RUN apk add --no-cache --virtual .build-deps \
        openssl \
    && wget -O dotnet.tar.gz https://download.visualstudio.microsoft.com/download/pr/206aebda-126f-484f-af02-051a17c1ec54/2ec559cb69cec83ffa64dba5441a1b2d/dotnet-sdk-6.0.301-linux-musl-x64.tar.gz \
    && dotnet_sha512='28e57adc8ac4a82bcfb2d3e623e43b04dc3f2327d7bbc130ecf122cb7d9d1a2f109f51fd14e9be0970e9ca4657d83d4771cc02e791c1e6ff4922d51b89af5f93' \
    && echo "$dotnet_sha512  dotnet.tar.gz" | sha512sum -c -
RUN mkdir -p /usr/share/dotnet
RUN tar -C /usr/share/dotnet -xzf dotnet.tar.gz
RUN ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet
RUN rm dotnet.tar.gz 

COPY docker-entrypoint.sh /bin/
RUN chmod 775 /bin/docker-entrypoint.sh
ENTRYPOINT ["/bin/docker-entrypoint.sh"]
