# Docker Images for Microsoft .NET Core development

The goal is to have a standard shared DotNetCore images for the Web development.

[Official Microsoft .NET Core SDK hub tags info](https://hub.docker.com/_/microsoft-dotnet-core-sdk/)

SDK Images will have the following installed:

- Node.js installation 10.14.1
- NVM Manager 0.31.2

## Tags

- `kdcllc/dotnet:3.0-sdk-base-bionic` - based image with Node.js installed and other utilities for web development.
- `kdcllc/dotnet:3.0-sdk-vscode-bionic` - VSCode Remote Container development incudes, Azure CLI, Docker-Compose, Kubernetes and Helm.
- `kdcllc/dotnet:3.0-sdk-bionic` - DotNetCore web development, builds and runs tests inside of the container.

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

    docker-compose -f "docker-compose-30-bionic.yml" up -d --build dotnet.builder.base
    docker-compose -f "docker-compose-30-bionic.yml" up -d --build dotnet.builder.vscode
    docker-compose -f "docker-compose-30-bionic.yml" up -d --build dotnet.builder.dev

    docker-compose -f "docker-compose-30-buster.yml" up -d
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

    docker push kdcllc/dotnet:3.0-sdk-base-bionic
    docker push kdcllc/dotnet:3.0-sdk-vscode-bionic
    docker push kdcllc/dotnet:3.0-sdk-bionic

    docker push kdcllc/dotnet:3.0-sdk-base-buster
    docker push kdcllc/dotnet:3.0-sdk-vscode-buster
    docker push kdcllc/dotnet:3.0-sdk-buster
```

## Notes

Original `Node.js` installation script [AspNet Docker](https://github.com/aspnet/aspnet-docker/issues/347#issuecomment-354316642)

## Mapping of the DotNet Core

- [AspNetCore Product Repos](https://github.com/topics/aspnet-product)

- [ASP.NET Core 2.2 Health Checks Explained](https://blog.elmah.io/asp-net-core-2-2-health-checks-explained/)

- [Keeping Secrets Safe in ASP.NET Core with Azure Key Vault and Managed Service Identity](https://anthonychu.ca/post/secrets-aspnet-core-key-vault-msi/)
- [Use Key Vault from App Service with Managed Service Identity](https://github.com/Azure-Samples/app-service-msi-keyvault-dotnet)
- [How to use managed identities for App Service and Azure Functions](https://docs.microsoft.com/en-us/azure/app-service/app-service-managed-service-identity)
