#!/bin/bash

#                        $1        $2            $3
# ./scripts/restore.sh $VERBOSE $PROJECT_PATH $NUGET_RESTORE
#                       #1      #2              #3/2        $4
#/scripts/restore.sh $VERBOSE $SOLUTION_BASE $PROJECT_PATH $NUGET_RESTORE
if [ "$1" == "true" ]; then
  if [ "$2" == "true" ]; then
    echo -e "\e[34m ---> Restoring Nuget Packages .sln in verbose mode...\e[0m" 
    dotnet restore $NUGET_RESTORE ./*.sln -v n
  else
    echo -e "\e[34m ---> Restoring Nuget Packages $3 in verbose mode...\e[0m" 
    dotnet restore $NUGET_RESTORE /app$3 -v n
  fi
else
 if [ "$2" == "true" ]; then
    echo -e "\e[34m ---> Restoring Nuget Packages .sln...\e[0m" 
    dotnet restore $NUGET_RESTORE ./*.sln 
  else
    echo -e "\e[34m ---> Restoring Nuget Packages $3...\e[0m" 
    dotnet restore $NUGET_RESTORE /app$3
  fi
fi

echo -e "\e[34m --->Restore completed ... \e[0m";