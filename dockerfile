FROM mcr.microsoft.com/dotnet/sdk:6.0 as build

WORKDIR /DockerLab/

COPY DockerLab .

RUN dotnet publish -c Release -o Release

FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine as runtime

WORKDIR /usr/DockerLab/

COPY --from=build /DockerLab/Release .

ENTRYPOINT ["dotnet", "DockerLab.dll"]