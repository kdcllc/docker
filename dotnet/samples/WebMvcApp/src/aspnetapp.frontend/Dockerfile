ARG DOTNET_VERSION

# Build image
FROM kdcllc/dotnet:3.0-sdk-buster as builder
RUN dotnet publish "./src/aspnetapp.frontend/aspnetapp.frontend.csproj" -c Release -p:NetCoreVersion=${DOTNET_VERSION} -o /app/publish

# App image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.0.0-preview8-buster-slim AS final
WORKDIR /app
EXPOSE 80
EXPOSE 443

COPY --from=builder /app/publish .
ENTRYPOINT ["dotnet", "aspnetapp.frontend.dll"]