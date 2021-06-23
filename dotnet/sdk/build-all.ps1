
Write-Output "Building 3.1 base images";

.\dotnet\sdk\build-base.ps1 -tag "3.1" -image "base"
.\dotnet\sdk\build-base.ps1 -tag "latest" -image "base"
.\dotnet\sdk\build-base.ps1 -tag "3.1-buster" -image "base"
.\dotnet\sdk\build-base.ps1 -tag "3.1-bionic" -image "base"
.\dotnet\sdk\build-base.ps1 -tag "3.1-alpine" -image "base.alpine"

# Write-Output "Building 5.0 base images";

# .\dotnet\sdk\build-base.ps1 -tag "5.0" -image "base5"
# .\dotnet\sdk\build-base.ps1 -tag "5.0-buster-slim" -image "base5"
# .\dotnet\sdk\build-base.ps1 -tag "5.0-focal" -image "base5"
# .\dotnet\sdk\build-base.ps1 -tag "5.0-alpine" -image "base.alpine5"


Write-Output "Building 3.1 dev images";

.\dotnet\sdk\build-base.ps1 -tag "3.1" -image "dev"
.\dotnet\sdk\build-base.ps1 -tag "latest" -image "dev"
.\dotnet\sdk\build-base.ps1 -tag "3.1-buster" -image "dev"
.\dotnet\sdk\build-base.ps1 -tag "3.1-bionic" -image "dev"
.\dotnet\sdk\build-base.ps1 -tag "3.1-alpine" -image "dev"

# Write-Output "Building 5.0 dev images";

# .\dotnet\sdk\build-base.ps1 -tag "5.0" -image "dev"
# .\dotnet\sdk\build-base.ps1 -tag "5.0-buster-slim" -image "dev"
# .\dotnet\sdk\build-base.ps1 -tag "5.0-focal" -image "dev"
# .\dotnet\sdk\build-base.ps1 -tag "5.0-alpine" -image "dev"

Write-Output "Building 3.1 mini images";

.\dotnet\sdk\build-base.ps1 -tag "3.1" -image "mini"
.\dotnet\sdk\build-base.ps1 -tag "latest" -image "mini"
.\dotnet\sdk\build-base.ps1 -tag "3.1-buster" -image "mini"
.\dotnet\sdk\build-base.ps1 -tag "3.1-bionic" -image "mini"
.\dotnet\sdk\build-base.ps1 -tag "3.1-alpine" -image "mini"

# Write-Output "Building 5.0 mini images";

# .\dotnet\sdk\build-base.ps1 -tag "5.0" -image "mini"
# .\dotnet\sdk\build-base.ps1 -tag "5.0-buster-slim" -image "mini"
# .\dotnet\sdk\build-base.ps1 -tag "5.0-focal" -image "mini"
# .\dotnet\sdk\build-base.ps1 -tag "5.0-alpine" -image "mini"

Write-Output "Building 3.1 vscode images";

.\dotnet\sdk\build-base.ps1 -tag "3.1" -image "vscode"
.\dotnet\sdk\build-base.ps1 -tag "latest" -image "vscode"
.\dotnet\sdk\build-base.ps1 -tag "3.1-buster" -image "vscode"
.\dotnet\sdk\build-base.ps1 -tag "3.1-bionic" -image "vscode"


# Write-Output "Building 5.0 vscode images";

# .\dotnet\sdk\build-base.ps1 -tag "5.0" -image "vscode"
# .\dotnet\sdk\build-base.ps1 -tag "5.0-buster-slim" -image "vscode"
# .\dotnet\sdk\build-base.ps1 -tag "5.0-focal" -image "vscode"
