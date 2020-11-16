
Write-Output "Building 3.1 base images";

.\build-base.ps1 -tag "3.1" -image "base"
.\build-base.ps1 -tag "latest" -image "base"
.\build-base.ps1 -tag "3.1-buster" -image "base"
.\build-base.ps1 -tag "3.1-bionic" -image "base"
.\build-base.ps1 -tag "3.1-alpine" -image "base.alpine"

# Write-Output "Building 5.0 base images";

# .\build-base.ps1 -tag "5.0" -image "base5"
# .\build-base.ps1 -tag "5.0-buster-slim" -image "base5"
# .\build-base.ps1 -tag "5.0-focal" -image "base5"
# .\build-base.ps1 -tag "5.0-alpine" -image "base.alpine5"


Write-Output "Building 3.1 dev images";

.\build-base.ps1 -tag "3.1" -image "dev"
.\build-base.ps1 -tag "latest" -image "dev"
.\build-base.ps1 -tag "3.1-buster" -image "dev"
.\build-base.ps1 -tag "3.1-bionic" -image "dev"
.\build-base.ps1 -tag "3.1-alpine" -image "dev"

# Write-Output "Building 5.0 dev images";

# .\build-base.ps1 -tag "5.0" -image "dev"
# .\build-base.ps1 -tag "5.0-buster-slim" -image "dev"
# .\build-base.ps1 -tag "5.0-focal" -image "dev"
# .\build-base.ps1 -tag "5.0-alpine" -image "dev"

Write-Output "Building 3.1 mini images";

.\build-base.ps1 -tag "3.1" -image "mini"
.\build-base.ps1 -tag "latest" -image "mini"
.\build-base.ps1 -tag "3.1-buster" -image "mini"
.\build-base.ps1 -tag "3.1-bionic" -image "mini"
.\build-base.ps1 -tag "3.1-alpine" -image "mini"

# Write-Output "Building 5.0 mini images";

# .\build-base.ps1 -tag "5.0" -image "mini"
# .\build-base.ps1 -tag "5.0-buster-slim" -image "mini"
# .\build-base.ps1 -tag "5.0-focal" -image "mini"
# .\build-base.ps1 -tag "5.0-alpine" -image "mini"

Write-Output "Building 3.1 vscode images";

.\build-base.ps1 -tag "3.1" -image "vscode"
.\build-base.ps1 -tag "latest" -image "vscode"
.\build-base.ps1 -tag "3.1-buster" -image "vscode"
.\build-base.ps1 -tag "3.1-bionic" -image "vscode"


# Write-Output "Building 5.0 vscode images";

# .\build-base.ps1 -tag "5.0" -image "vscode"
# .\build-base.ps1 -tag "5.0-buster-slim" -image "vscode"
# .\build-base.ps1 -tag "5.0-focal" -image "vscode"
