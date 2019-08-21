#!/bin/bash
#                                #1          #2 (bool)               #3             #4
# ONBUILD RUN /scripts/build.sh $VERBOSE [ -z $DOTNET_VERSION] $DOTNET_VERSION $PROJECT_PATH 

if [ "$1" == "true" ]; then
  if [ "$2" == "true" ] && [ ! -z "$4" ]; then
      # ./build.sh true true "4.0" "myproject.proj"
      echo -e "\e[34m --->Building the $4  with version $3 in verbose mode...\e[0m" 
      dotnet build -c Release /app$4 -p:NetCoreVersion=$3 -v n
  elif [ "$2" == "true" ] && [ -z "$4" ]; then
    # ./build.sh true true "4.0" ""
    echo -e "\e[34m --->Building the*.sln  with version $3 in verbose mode...\e[0m" 
    dotnet build  ./*.sln -p:NetCoreVersion=$3 -c Release -v n
  fi

  if [ "$2" == "false" ] && [ ! -z "$4" ]; then
      # ./build.sh true false ""  "myproject.proj"
      echo -e "\e[34m --->Building the $4  in verbose mode...\e[0m" 
      dotnet build -c Release /app$4 -v n
  elif [ "$2" == "false" ] && [ -z "$4" ]; then
    # ./build.sh true false ""  ""
    echo -e "\e[34m --->Building the *.sln in verbose mode...\e[0m" 
    dotnet build  ./*.sln -c Release -v n
  fi
else
    if [ "$2" == "true" ] && [ ! -z "$4" ]; then
      # ./build.sh false true "4.0" "myproject.proj"
      echo -e "\e[34m --->Building the $4  with version $3 ...\e[0m" 
      dotnet build -c Release /app$4 -p:NetCoreVersion=$3
  elif [ "$2" == "true" ] && [ -z "$4" ]; then
    # ./build.sh false true "4.0" ""
    echo -e "\e[34m --->Building the*.sln  with version $3 ..\e[0m" 
    dotnet build  ./*.sln -p:NetCoreVersion=$3 -c Release
  fi

  if [ "$2" == "false" ] && [ ! -z "$4" ]; then
      # ./build.sh false false "" "myproject.proj"
      echo -e "\e[34m --->Building the $4 file \e[0m" 
      dotnet build -c Release /app$4
  elif [ "$2" == "false" ] && [ -z "$4" ]; then
    echo -e "\e[34m --->Building the *.sln ... \e[0m" 
    dotnet build  ./*.sln -c Release
  fi
fi
