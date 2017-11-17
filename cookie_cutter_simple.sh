#!\bin\bash

# The root folder name: default name 'Project'
# or user provided name as the first argument for this script
RootName=${1:-new_project}

# Check if root folder alread in the current folder.
if [ -d "./$RootName" ]; then
  echo "The folder './$RootName' exist in the current folder!"
  echo "Do you want to remove and create new folder [yes/no]:"
  read input_variable

  # If user input is "yes", then remove the existing root folder
  if [ $input_variable = "yes" ]; then
    rm -rf "$RootName"
  else
    echo "Fail to create new file structure because the folder already exist!"
    exit
  fi
fi

# create the project folder
mkdir $RootName
# go to the project folder
cd $RootName

# create a README.md file and give some basic descriptions
touch README.md
echo -e "# Project Name" > README.md
echo "description goes here." >> README.md
echo "### Data Description" >> README.md
echo "data sources and descriptions go here." >> README.md
echo "### Analysis and Coding" >> README.md
echo "Summary of analysis methods and codes go here." >> README.md

# create the LICENSE.md file
touch LICENSE.md
echo "Copyright ..." > LICENSE.md

# create directories for data, documentation, source codes, results, img, and from_joe
mkdir data
mkdir doc
mkdir src
mkdir results
mkdir img
mkdir from_joe
