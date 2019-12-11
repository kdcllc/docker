ARG DOTNET_VERSION

# Build image
FROM kdcllc/dotnet-sdk:3.1-buster as builder
RUN dotnet publish "./src/aspnetapp.frontend/aspnetapp.frontend.csproj" -c Release -p:NetCoreVersion=${DOTNET_VERSION} -o /app/publish

# App image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS final
WORKDIR /app
EXPOSE 80
EXPOSE 443

COPY --from=builder /app/publish .
ENTRYPOINT ["dotnet", "aspnetapp.frontend.dll"]