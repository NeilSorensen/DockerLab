FROM mcr.microsoft.com/dotnet/sdk:6.0 as build

WORKDIR /DockerLab/

COPY DockerLab .

RUN dotnet publish -c Release -o Release

