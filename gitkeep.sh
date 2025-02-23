#!/bin/bash
dir=$(echo "$@");
if [[ ${dir} == "." || ${dir} == "here" ]]; then
  dir="$(pwd)";
fi;

# if directory does not exist or if no input was given
if [[ ! -d "${dir}" || ${dir} == "" ]]; then
  echo -e "\nPlease specify an existing directory.\n";
  exit;
fi;

# if directory provided is not empty
if [[ ! $(find "${dir}/" -type d -empty) ]]; then
  echo -e "\nThe directory provided is not empty. No need to gitkeep.\n";
  exit;
fi;

find "${dir}/" -type d -empty -exec echo "Touching {}/.gitkeep" \; -exec touch "{}/.gitkeep" \;
echo "done."