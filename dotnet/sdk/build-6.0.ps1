
Write-Output "Building 6.0 base images";

.\dotnet\sdk\build-base.ps1 -tag "6.0" -image "base"
.\dotnet\sdk\build-base.ps1 -tag "6.0-bullseye-slim" -image "base"
.\dotnet\sdk\build-base.ps1 -tag "6.0-focal" -image "base"
.\dotnet\sdk\build-base.ps1 -tag "6.0-alpine" -image "base.alpine"
.\dotnet\sdk\build-base.ps1 -tag "6.0-alpine3.13" -image "base.alpine"

Write-Output "Building 6.0 dev images";

.\dotnet\sdk\build-base.ps1 -tag "6.0" -image "dev"
.\dotnet\sdk\build-base.ps1 -tag "6.0-bullseye-slim" -image "dev"
.\dotnet\sdk\build-base.ps1 -tag "6.0-focal" -image "dev"
.\dotnet\sdk\build-base.ps1 -tag "6.0-alpine" -image "dev"
.\dotnet\sdk\build-base.ps1 -tag "6.0-alpine3.13" -image "dev"

Write-Output "Building 6.0 mini images";

.\dotnet\sdk\build-base.ps1 -tag "6.0" -image "mini"
.\dotnet\sdk\build-base.ps1 -tag "6.0-bullseye-slim" -image "mini"
.\dotnet\sdk\build-base.ps1 -tag "6.0-focal" -image "mini"
.\dotnet\sdk\build-base.ps1 -tag "6.0-alpine" -image "mini"
.\dotnet\sdk\build-base.ps1 -tag "6.0-alpine3.13" -image "mini"

Write-Output "Building 6.0 vscode images";

.\dotnet\sdk\build-base.ps1 -tag "6.0" -image "vscode"
.\dotnet\sdk\build-base.ps1 -tag "6.0-bullseye-slim" -image "vscode"
.\dotnet\sdk\build-base.ps1 -tag "6.0-focal" -image "vscode"