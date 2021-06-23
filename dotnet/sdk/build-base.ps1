# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies
# Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process
param (

    # The dotnet tag to build
    $tag = "3.1",

    $image = "base"
)

function Go () {

    Write-Host "Building Docker Image for $tag for $image..." -foregroundColor "green"
    
    $Env:TAG=$tag
    docker-compose -f ".\dotnet\sdk\docker-compose.yml" up -d --remove-orphans --build $image

    $repo = "kdcllc/dotnet-sdk-"+ $image + ":" +$Env:TAG
    
    if ($image -eq "base.alpine"){
        $repo = "kdcllc/dotnet-sdk-base:" + $Env:TAG
    }

    if ($image -eq "dev"){
        $repo = "kdcllc/dotnet-sdk:" + $Env:TAG
    }

    Write-Host "Publishing Docker Image for $repo ..." -foregroundColor "green"
    
    docker push  $repo
}

function Main () {  
    Go   
}

# Executes the main function
Main  