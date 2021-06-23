
Write-Output "Building 5.0 base images";

./dotnet/sdk/build-base.ps1 -tag "5.0" -image "base"
./dotnet/sdk/build-base.ps1 -tag "5.0-buster-slim" -image "base"
./dotnet/sdk/build-base.ps1 -tag "5.0-focal" -image "base"
./dotnet/sdk/build-base.ps1 -tag "5.0-alpine" -image "base.alpine"

Write-Output "Building 5.0 dev images";

./dotnet/sdk/build-base.ps1 -tag "5.0" -image "dev"
./dotnet/sdk/build-base.ps1 -tag "5.0-buster-slim" -image "dev"
./dotnet/sdk/build-base.ps1 -tag "5.0-focal" -image "dev"
./dotnet/sdk/build-base.ps1 -tag "5.0-alpine" -image "dev"

Write-Output "Building 5.0 mini images";

./dotnet/sdk/build-base.ps1 -tag "5.0" -image "mini"
./dotnet/sdk/build-base.ps1 -tag "5.0-buster-slim" -image "mini"
./dotnet/sdk/build-base.ps1 -tag "5.0-focal" -image "mini"
./dotnet/sdk/build-base.ps1 -tag "5.0-alpine" -image "mini"

Write-Output "Building 5.0 vscode images";

./dotnet/sdk/build-base.ps1 -tag "5.0" -image "vscode"
./dotnet/sdk/build-base.ps1 -tag "5.0-buster-slim" -image "vscode"
./dotnet/sdk/build-base.ps1 -tag "5.0-focal" -image "vscode"