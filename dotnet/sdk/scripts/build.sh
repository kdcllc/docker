#!/bin/bash
#                     #1        #2              #3            #4
# /scripts/build.sh $VERBOSE $SOLUTION_BASE $PROJECT_PATH $DOTNET_VERSION
if [ "$1" == "true" ]; then
  if [ "$2" == "true" ]; then
    echo -e "\e[34m --->Building the *.sln  with version $4 in verbose mode...\e[0m" 
    dotnet build  ./*.sln -p:NetCoreVersion=$4 -c Release -v n
  else
    echo -e "\e[34m --->Building the $3  with version $4 in verbose mode...\e[0m" 
    dotnet build -c Release /app$3 -p:NetCoreVersion=$4 -v n
  fi
else
    if [ "$2" == "true" ]; then
      echo -e "\e[34m --->Building the *.sln  with version $4 ..\e[0m" 
      dotnet build  ./*.sln -p:NetCoreVersion=$4 -c Release
  else
      echo -e "\e[34m --->Building the $3  with version $4 ...\e[0m" 
      dotnet build -c Release /app$3 -p:NetCoreVersion=$4
  fi
fi
 
 echo -e "\e[34m --->Build completed ... \e[0m";