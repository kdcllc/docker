# Running this sample

This sample project provides a way to build and run with different frameworks.

```bash
    dotnet build aspnetapp.sln -p:NetCoreVersion=netcore30
    dotnet build aspnetapp.sln -p:NetCoreVersion=netcore22
```

```bash
    docker-compose -f "docker-compose.yml" up -d --build

    docker-compose -f "docker-compose.yml" -f "docker-compose.override.yml" up -d --build
```