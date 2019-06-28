#!/bin/bash

# ONBUILD RUN /scripts/restore.sh $VERBOSE $PROJECT_PATH
if [ "$1" == "true" ]; then
  if [ -z "$2" ]; then
    echo -e "\e[34m ---> Restoring Nuget Packages .sln in verbose mode...\e[0m" 
    dotnet restore ./*.sln -v n
  else
    echo -e "\e[34m ---> Restoring Nuget Packages $2 in verbose mode...\e[0m" 
    dotnet restore /app$2 -v n
  fi
else
 if [ -z "$2" ]; then
    echo -e "\e[34m ---> Restoring Nuget Packages .sln...\e[0m" 
    dotnet restore ./*.sln
  else
    echo -e "\e[34m ---> Restoring Nuget Packages $2...\e[0m" 
    dotnet restore /app$2
  fi
fi
