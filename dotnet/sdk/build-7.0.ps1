
Write-Output "Building 7.0 base images";

./dotnet/sdk/build-base.ps1 -tag "7.0" -image "base"
./dotnet/sdk/build-base.ps1 -tag "7.0-bullseye-slim" -image "base"
./dotnet/sdk/build-base.ps1 -tag "7.0-jammy" -image "base"
./dotnet/sdk/build-base.ps1 -tag "7.0-alpine" -image "base.alpine"
./dotnet/sdk/build-base.ps1 -tag "7.0-alpine3.16" -image "base.alpine"

Write-Output "Building 7.0 dev images";

./dotnet/sdk/build-base.ps1 -tag "7.0" -image "dev"
./dotnet/sdk/build-base.ps1 -tag "7.0-bullseye-slim" -image "dev"
./dotnet/sdk/build-base.ps1 -tag "7.0-jammy" -image "dev"
./dotnet/sdk/build-base.ps1 -tag "7.0-alpine" -image "dev"
./dotnet/sdk/build-base.ps1 -tag "7.0-alpine3.16" -image "dev"

Write-Output "Building 7.0 mini images";

./dotnet/sdk/build-base.ps1 -tag "7.0" -image "mini"
./dotnet/sdk/build-base.ps1 -tag "7.0-bullseye-slim" -image "mini"
./dotnet/sdk/build-base.ps1 -tag "7.0-jammy" -image "mini"
./dotnet/sdk/build-base.ps1 -tag "7.0-alpine" -image "mini"
./dotnet/sdk/build-base.ps1 -tag "7.0-alpine3.16" -image "mini"

Write-Output "Building 7.0 vscode images";

./dotnet/sdk/build-base.ps1 -tag "7.0" -image "vscode"
./dotnet/sdk/build-base.ps1 -tag "7.0-bullseye-slim" -image "vscode"
./dotnet/sdk/build-base.ps1 -tag "7.0-jammy" -image "vscode"