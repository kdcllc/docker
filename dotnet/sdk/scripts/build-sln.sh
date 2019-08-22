#!/bin/bash
#                     #1        #2    
# /scripts/build.sh $VERBOSE $DOTNET_VERSION
if [ "$1" == "true" ]; then
    echo -e "\e[34m --->Building the *.sln  with version $2 in verbose mode...\e[0m" 
    dotnet build  ./*.sln -p:NetCoreVersion=$2 -c Release -v n
else
    echo -e "\e[34m --->Building the *.sln  with version $2 ..\e[0m" 
    dotnet build  ./*.sln -p:NetCoreVersion=$2 -c Release
fi
 
 echo -e "\e[34m --->Build completed ... \e[0m";