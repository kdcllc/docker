#!/bin/bash

#                       #1      #2              #3              $4
#/scripts/restore.sh $VERBOSE $SOLUTION_BASE $NUGET_RESTORE $PROJECT_PATH 
if [ "$1" == "true" ]; then
  if [ "$2" == "true" ]; then
    echo -e "\e[34m ---> Restoring Nuget Packages .sln in verbose mode...\e[0m" 
    dotnet restore $3 ./*.sln -v n
  else
    echo -e "\e[34m ---> Restoring Nuget Packages $4 in verbose mode...\e[0m" 
    dotnet restore $3 /app$4 -v n
  fi
else
 if [ "$2" == "true" ]; then
    echo -e "\e[34m ---> Restoring Nuget Packages .sln...\e[0m" 
    dotnet restore $3 ./*.sln 
  else
    echo -e "\e[34m ---> Restoring Nuget Packages $4...\e[0m" 
    dotnet restore $3 /app$4
  fi
fi

echo -e "\e[34m --->Restore completed ... \e[0m";