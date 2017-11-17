#!\bin\bash

mkdir ${1:-Project}

cd ${1:-Project}



touch README.md
echo -e "# Project Name" > README.md
echo "description goes here." >> README.md
echo "### Data Description" >> README.md
echo "data sources and descriptions go here." >> README.md
echo "### Analysis and Coding" >> README.md
echo "Summary of analysis methods and codes go here." >> README.md

touch LICENSE.md
echo "Copyright ..." > LICENSE.md

mkdir data
mkdir doc
mkdir src
mkdir results
mkdir from_joe
