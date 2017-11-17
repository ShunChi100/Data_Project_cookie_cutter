#!\bin\bash

# create a project folder with the default name 'Project' or user provided name
mkdir ${1:-Project}
# go to the project folder
cd ${1:-Project}

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

# create directories for data, documentation, source codes, results, and from_joe
mkdir data
mkdir doc
mkdir src
mkdir results
mkdir from_joe
