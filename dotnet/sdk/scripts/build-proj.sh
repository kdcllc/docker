#!/bin/bash
#                     #1        #2             #3  
# /scripts/build.sh $VERBOSE $PROJECT_PATH $DOTNET_VERSION
if [ "$1" == "true" ]; then
    echo -e "\e[34m --->Building the project $2  with version $3 in verbose mode...\e[0m" 
    dotnet build -c Release /app$2 -p:NetCoreVersion=$3 -v n
else
    echo -e "\e[34m --->Building the project $2  with version $3 ...\e[0m" 
    dotnet build -c Release /app$2 -p:NetCoreVersion=$3
fi
 
 echo -e "\e[34m --->Build completed ... \e[0m";