# Docker Images for Microsoft .NET Core development

The goal is to have a standard shared DotNetCore images for the Web development that provides with custom `ONBUILD` actions for DotNetCore projects.

[Official Microsoft .NET Core SDK hub tags info](https://hub.docker.com/_/microsoft-dotnet-core-sdk/)

## Label 4.0 Image Tags

### Base Development image `kdcllc/dotnet-sdk-base:latest`

- The base images for Web Application development includes Node.js and other utilities.
- Installs Node.js installation 12.13.1 (Alpine nodejs v10.16.3)

| Tag | Other Tags | OS |
| --- | ---|  ---|
| 2.1 | 2.1-stretch | (Debian 9) |
| 2.2 | 2.2-stretch | (Debian 9) |
| 2.2-bionic | | (Ubuntu 18.04) |
| 3.0 | 3.0-buster | (Debian 10) |
| 3.0-bionic | | (Ubuntu 18.04) |
| 3.0-alpine | | (Alpine 3.10) |
| 3.1 | 3.1-buster, `latest` | (Debian 10) |
| 3.1-bionic | | (Ubuntu 18.04) |
| 3.1-alpine | | (Alpine 3.10) |

```ps1
     Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process

    .\build-base.ps1 -tag "3.1" -image "base"
    .\build-base.ps1 -tag "latest" -image "base"
    .\build-base.ps1 -tag "3.1-buster" -image "base"
    .\build-base.ps1 -tag "3.1-bionic" -image "base"
    .\build-base.ps1 -tag "3.1-alpine" -image "base.alpine"
```

### Development SDK `kdcllc/dotnet-sdk:latest`

- The template based DotNetCore development, builds and runs tests inside of the container.

| Tag | Other Tags | OS |
| --- | ---|  ---|
| 2.1 | 2.1-stretch | (Debian 9) |
| 2.2 | 2.2-stretch | (Debian 9) |
| 2.2-bionic | | (Ubuntu 18.04) |
| 3.0 | 3.0-buster | (Debian 10) |
| 3.0-bionic | | (Ubuntu 18.04) |
| 3.0-alpine | | (Alpine 3.10) |
| 3.1 | 3.1-buster, `latest` | (Debian 10) |
| 3.1-bionic | | (Ubuntu 18.04) |
| 3.1-alpine | | (Alpine 3.10) |

```ps1
    .\build-base.ps1 -tag "3.1" -image "dev"
    .\build-base.ps1 -tag "latest" -image "dev"
    .\build-base.ps1 -tag "3.1-buster" -image "dev"
    .\build-base.ps1 -tag "3.1-bionic" -image "dev"
    .\build-base.ps1 -tag "3.1-alpine" -image "dev"
```

### The minimal development SDK `kdcllc/dotnet-sdk-mini`

- The template version `mini` of the based DotNetCore development.

| Tag | Other Tags | OS |
| --- | ---|  ---|
| 2.1 | 2.1-stretch | (Debian 9) |
| 2.2 | 2.2-stretch | (Debian 9) |
| 2.2-bionic | | (Ubuntu 18.04) |
| 3.0 | 3.0-buster | (Debian 10) |
| 3.0-bionic | | (Ubuntu 18.04) |
| 3.0-alpine | | (Alpine 3.10) |
| 3.1 | 3.1-buster, `latest` | (Debian 10) |
| 3.1-bionic | | (Ubuntu 18.04) |
| 3.1-alpine | | (Alpine 3.10) |

```ps1
    .\build-base.ps1 -tag "3.1" -image "mini"
    .\build-base.ps1 -tag "latest" -image "mini"
    .\build-base.ps1 -tag "3.1-buster" -image "mini"
    .\build-base.ps1 -tag "3.1-bionic" -image "mini"
    .\build-base.ps1 -tag "3.1-alpine" -image "mini"
```

### Visual Studio Code Remote Container Development `kdcllc/dotnet-sdk-vscode`

- The VSCode Remote Container image used for VSCode development and it incudes, Azure CLI, Docker-Compose, Kubernetes and Helm.

| Tag | Other Tags | OS |
| --- | ---|  ---|
| 2.1 | 2.1-stretch | (Debian 9) |
| 2.2 | 2.2-stretch | (Debian 9) |
| 2.2-bionic | | (Ubuntu 18.04) |
| 3.0 | 3.0-buster | (Debian 10) |
| 3.0-bionic | | (Ubuntu 18.04) |
| 3.0-alpine | | (Alpine 3.10) |
| 3.1 | 3.1-buster, `latest` | (Debian 10) |
| 3.1-bionic | | (Ubuntu 18.04) |

```ps1
    .\build-base.ps1 -tag "3.1" -image "vscode"
    .\build-base.ps1 -tag "latest" -image "vscode"
    .\build-base.ps1 -tag "3.1-buster" -image "vscode"
    .\build-base.ps1 -tag "3.1-bionic" -image "vscode"
```

## Sample projects

These project serve as a templates for the Docker images. In case of `WebMvcApp` it utilized the required structure for the SDK image to be used.

- [WebApp30](./dotnet/samples/WebApp30/README.md) AspNetCore 3.0 Web Application demonstrates VS Code Containers, dev build and Visual Studio.NET debugging.
- [WebAppLight30](./dotnet/samples/WebAppLight30/README.md)
- [WebMvcApp](./dotnet/samples/WebMvcApp/README.md) AspNetCore 2.x or 3.0 Web application based on `NetCoreVersion` msbuild attribute.

### Usage

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

## Notes

Clean up docker local system

```bash
    # clean up system
    docker system prune -f
    docker container prune -f

    # list all images
    docker images -f dangling=true
    # clean up
    docker rmi -f $(docker images -f "dangling=true" -q)
```

Original `Node.js` installation script [AspNet Docker](https://github.com/aspnet/aspnet-docker/issues/347#issuecomment-354316642)

## Mapping of the DotNet Core

- [AspNetCore Product Repos](https://github.com/topics/aspnet-product)

- [ASP.NET Core 2.2 Health Checks Explained](https://blog.elmah.io/asp-net-core-2-2-health-checks-explained/)

- [Keeping Secrets Safe in ASP.NET Core with Azure Key Vault and Managed Service Identity](https://anthonychu.ca/post/secrets-aspnet-core-key-vault-msi/)
- [Use Key Vault from App Service with Managed Service Identity](https://github.com/Azure-Samples/app-service-msi-keyvault-dotnet)
- [How to use managed identities for App Service and Azure Functions](https://docs.microsoft.com/en-us/azure/app-service/app-service-managed-service-identity)
