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

# setting version control
echo "Do you want to set up version control now? [yes/no]"
read version_control_flag

while true
do
  if [ $version_control_flag = "yes" ]; then
    break
  elif [ $version_control_flag = "no" ]; then
    break
  else
    echo "$version_control_flag"
    echo "Not valid input. TRY again"
    echo "Do you want to set up version control now? [yes/no]"
    read version_control_flag
  fi
done

if [ $version_control_flag = "yes" ]; then
  echo "*****************************************************"
  git init
  echo " "
  echo "*****************************************************"
  echo "Copy your github repo url to here: "
  read github_url
  git remote add origin $github_url
  echo " "
  echo "*****************************************************"
  echo "github repo is connected"
  git remote -v
  git pull origin master
else
  echo "Version control hasn't been set!"
fi

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
mkdir img

# Making more sub-folders?
echo "Add sub-folders other than data, doc, src, results, and img? [yes/no]"
read more_folder

while true
do
  if [ $more_folder = "yes" ];
  then
    # commit and push
    echo "sub-folder name (no space, one folder name each time):"
    read subfolder_name
    mkdir $subfolder_name

    echo "Add more sub-folders [yes/no]"
    read more_folder

  elif [ $more_folder = "no" ];
  then
    echo "No more sub-folders added!"
    break
  else
    echo "Not valid input. TRY again"
    echo "sub-folders other than data, doc, src, results, and from_joe? [yes/no]"
    read more_folder
  fi
done


# push new files to github
# make sure github remote has been added
if [ $version_control_flag = "yes" ]; then
  echo " "
  echo "******************************************************"

  # read from user choice
  echo "Do you want to push everything now? [yes/no]"
  read push_to_github

  # ensure the user input is either yes or no
  while true
  do
    if [ $push_to_github = "yes" ];
    then
      # commit and push
      git add .
      git commit -m "First commit"
      git push origin master
      break
    elif [ $push_to_github = "no" ];
    then
      echo "No push to github this time!"
      break
    else
      echo "Not valid input. TRY again"
      echo "Do you want to push everything now? [yes/no]"
      read push_to_github
    fi
  done

fi
