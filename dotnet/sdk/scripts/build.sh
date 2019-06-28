#!/bin/bash

if [ -z "$1" ]; then 
 echo -e "\e[34mBuilding the Solution framework version\e[0m" 
    if [ -z "$2" ]; then
      echo -e "\e[34mDotNetCore Framework must be present\e[0m"
      exit 1;
    else
      dotnet build  ./*.sln -framework $2 -c Release 
   fi
else 
  echo -e "\e[34mBuilding the Solution with coreversion\e[0m" 
  dotnet build  ./*.sln -p:NetCoreVersion=$1 -c Release 
fi