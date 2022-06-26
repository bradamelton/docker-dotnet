FROM alpine:latest

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
    && wget -O dotnet.tar.gz https://download.visualstudio.microsoft.com/download/pr/dc930bff-ef3d-4f6f-8799-6eb60390f5b4/1efee2a8ea0180c94aff8f15eb3af981/dotnet-sdk-6.0.300-linux-x64.tar.gz \
    && dotnet_sha512='52d720e90cfb889a92d605d64e6d0e90b96209e1bd7eab00dab1d567017d7a5a4ff4adbc55aff4cffcea4b1bf92bb8d351859d00d8eb65059eec5e449886c938' \
    && echo "$dotnet_sha512  dotnet.tar.gz" | sha512sum -c -
RUN mkdir -p /usr/share/dotnet
RUN tar -C /usr/share/dotnet -xzf dotnet.tar.gz
RUN ls -al /usr/share/dotnet
RUN ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet
RUN ls -al /usr/bin/dotnet
RUN rm dotnet.tar.gz 
#RUN chmod 775 /usr/share/dotnet/dotnet
#RUN /usr/share/dotnet/dotnet help

COPY docker-entrypoint.sh /bin/
RUN chmod 775 /bin/docker-entrypoint.sh
ENTRYPOINT ["/bin/docker-entrypoint.sh"]
