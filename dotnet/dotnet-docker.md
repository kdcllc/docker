# Docker Images for Microsoft .NET Core development

The purpose of this `Dockerfile` is to create a generic .NET build images that is based on Microsoft images.

In addition it contains the following:

- Node.js installation 10.14.1
- NVM Manager 0.31.2

## Usage

[AspNetCore Core Sample App](./dotnet/samples/aspnetappmvc/src/aspnetapp.frontend/Dockerfile)

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

### Individual builds

```bash

    docker-compose -f "docker-compose-21.yml" up -d --build dotnet.builder.base
    docker-compose -f "docker-compose-21.yml" up -d --build dotnet.builder.vscode
    docker-compose -f "docker-compose-21.yml" up -d --build dotnet.builder.dev
```

### Batch builds

```bash
    docker-compose -f "docker-compose-21.yml" up -d
    docker-compose -f "docker-compose-22.yml" up -d
    docker-compose -f "docker-compose-30.yml" up -d
```

### Pushed Docker images to repo

```bash

    docker push kdcllc/dotnet:2.1-sdk-base
    docker push kdcllc/dotnet:2.1-sdk-vscode
    docker push kdcllc/dotnet:2.1-sdk

    docker push kdcllc/dotnet:2.2-sdk-base
    docker push kdcllc/dotnet:2.2-sdk-vscode
    docker push kdcllc/dotnet:2.2-sdk

    docker push kdcllc/dotnet:3.0-sdk-base
    docker push kdcllc/dotnet:3.0-sdk-vscode
    docker push kdcllc/dotnet:3.0-sdk
```
## Notes

Original `Node.js` installation script [AspNet Docker](https://github.com/aspnet/aspnet-docker/issues/347#issuecomment-354316642)