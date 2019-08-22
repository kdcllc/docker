FROM mcr.microsoft.com/dotnet/core/aspnet:3.0.0-preview8-buster-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:3.0.0-preview8-buster AS build
WORKDIR /src
COPY ["src/WebApp30/WebApp30.csproj", "src/WebApp30/"]
RUN dotnet restore "src/WebApp30/WebApp30.csproj"
COPY . .
WORKDIR "/src/src/WebApp30"
RUN dotnet build "WebApp30.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "WebApp30.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "WebApp30.dll"]
