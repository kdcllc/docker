
FROM kdcllc/dotnet:3.0-sdk-buster as builder
RUN dotnet publish "./src/WebApp30/WebApp30.csproj" -c Release  -o /app


FROM mcr.microsoft.com/dotnet/core/aspnet:3.0.0-preview8-buster-slim AS final
WORKDIR /app
EXPOSE 80
EXPOSE 443

COPY --from=builder /app .
ENTRYPOINT ["dotnet", "WebApp30.dll"]
