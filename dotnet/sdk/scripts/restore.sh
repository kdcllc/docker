#!/bin/bash

#                                   $1        $2            $3
# ONBUILD RUN ./scripts/restore.sh $VERBOSE $PROJECT_PATH $NUGET_RESTORE
if [ "$1" == "true" ]; then
  if [ ! -z "$2" ]; then
    echo -e "\e[34m ---> Restoring Nuget Packages .sln in verbose mode...\e[0m" 
    dotnet restore ./*.sln -v n $NUGET_RESTORE
  else
    echo -e "\e[34m ---> Restoring Nuget Packages $2 in verbose mode...\e[0m" 
    dotnet restore /app$2 -v n $NUGET_RESTORE
  fi
else
 if [ ! -z "$2" ]; then
    echo -e "\e[34m ---> Restoring Nuget Packages .sln...\e[0m" 
    dotnet restore ./*.sln $NUGET_RESTORE
  else
    echo -e "\e[34m ---> Restoring Nuget Packages $2...\e[0m" 
    dotnet restore /app$2 $NUGET_RESTORE
  fi
fi
