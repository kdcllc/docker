# Build image
FROM kdcllc/dotnet:3.0-sdk-light-buster as builder
RUN dotnet publish "./src/WebApp30/WebApp30.csproj" -c Release -o /app
RUN echo npm -v

# App image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.0 AS final
WORKDIR /app
EXPOSE 80
EXPOSE 443

COPY --from=builder /app .
ENTRYPOINT ["dotnet", "WebApp30.dll"]