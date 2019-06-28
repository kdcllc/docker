#!/bin/bash

if [ "$1" == "true" ]; then
  echo -e "\e[34mVerbose Restore\e[0m" 
  dotnet restore ./*.sln -v n
else 
  echo -e "\e[34mRestoring Nuget Packages\e[0m" 
  dotnet restore ./*.sln 
fi