docker build --rm -f "./docker-dotnet-sdk/Dockerfile" -t docker-dotnet-sdk:latest "."
docker build --rm -f "./docker-dotnet-runtime/Dockerfile" -t docker-dotnet-runtime:latest "."