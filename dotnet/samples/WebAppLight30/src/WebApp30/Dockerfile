# Build image
FROM kdcllc/dotnet-sdk-mini:3.1-buster as builder
RUN dotnet publish "./src/WebApp30/WebApp30.csproj" -c Release -o /app
RUN echo npm -v

# App image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS final
WORKDIR /app
EXPOSE 80
EXPOSE 443

COPY --from=builder /app .
ENTRYPOINT ["dotnet", "WebApp30.dll"]