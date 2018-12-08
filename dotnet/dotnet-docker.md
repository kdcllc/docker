# Docker Images for Microsoft .NET Core development

Building images:

```bash
    docker-compose -f "dotnet\sdk\docker-compose.yml" up -d --build dotnet.builder.21
    docker-compose -f "dotnet\sdk\docker-compose.yml" up -d --build dotnet.builder.22
```

```bash
    docker push kdcllc/dotnet:2.1-sdk
    docker push kdcllc/dotnet:2.2-sdk
```