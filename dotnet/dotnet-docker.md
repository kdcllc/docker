# Docker Images for Microsoft .NET Core development
The purpose of this `Dockerfile` is to create a generic .NET build images that is based on Microsoft images. 

In addition it contains the following:

- Node.js installation 10.14.1
- NVM Manager 0.31.2

## Usage
[Aspnet Core Sample App](./dotnet/samples/aspnetappmvc/src/aspnetapp.frontend/Dockerfile)

```dockerfile
    # Build image
    FROM kdcllc:dotnet:3.0 as builder
    RUN dotnet publish "./src/aspnetapp.frontend/aspnetapp.frontend.csproj" -c Release -p:NetCoreVersion=${coreversion} -o /app
    RUN npm -v

    # App image
    FROM ${runtimeImage}:${runtimeTag} AS final
    WORKDIR /app
    COPY --from=builder /app .
    ENTRYPOINT ["dotnet", "aspnetapp.frontend.dll"]

```

## Building images

Build Docker images
```bash
    docker-compose -f "docker-compose.yml" up -d --build dotnet.builder.21
    docker-compose -f "docker-compose.yml" up -d --build dotnet.builder.22
    docker-compose -f "docker-compose.yml" up -d --build dotnet.builder.30
```

Pushed Docker images to repo
```bash
    docker push kdcllc/dotnet:2.1-sdk
    docker push kdcllc/dotnet:2.2-sdk
    docker push kdcllc/dotnet:3.0-sdk
```

## Notes

Original `Node.js` installation script [AspNet Docker](https://github.com/aspnet/aspnet-docker/issues/347#issuecomment-354316642)