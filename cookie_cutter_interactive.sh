#!\bin\bash

#% DESCRIPTION
#%    This is cookie cutter for interactively creating a file and folder
#% structure for a new data science project
#%
#% EXAMPLES
#%    $bash cookie_cutter_interactive root_folder_name
#% Here the root_folder_name is optional, the default name is *new_project*
#================================================================
#- IMPLEMENTATION
#-    version         $0.0.1
#-    author          Shun CHI
#-    copyright       Copyright https://github.com/ShunChi100/Data_Project_cookie_cutter.git
#-    license         GNU General Public License
#================================================================
#  HISTORY
#     2017/11/16 : Shun: Script creation
#     2017/11/17 : Shun : Added interactive options for version control, adding more sub folders
#================================================================


# The root folder name: default name 'Project'
# or user provided name as the first argument for this script
RootName=${1:-new_project}

# Check if root folder alread in the current folder.
# if the folder is already existing, interactively choose to keep it
# or delete it and create a new one
if [ -d "./$RootName" ];
then
  echo "The folder './$RootName' exist in the current folder!"
  echo "Do you want to remove it and create a new folder [yes/no]:"
  echo "(Reomve is PERMANENT, Think Carefully!!!)"
  read input_variable


  while true
  do
    # If user input is "yes", then remove the existing root folder
    if [ $input_variable = "yes" ];
    then
      rm -rf "$RootName"
      break

    # If user input is "no", exit the script
    elif [ $input_variable = "no" ];
    then
      echo "Fail to create new file structure because the folder already exist!"
      exit

    # Ensure user input is either "yes" or "no"
    else
      echo "Not valid input. Must be either yes or no. TRY again"
      echo "Do you want to remove existing folder $RootName and create a new folder [yes/no]:"
      echo "(Reomve is PERMANENT, Think Carefully!!!)"
      read input_variable
    fi
  done
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
  # If user input is "yes", then setting version control and connected to github repo
  if [ $version_control_flag = "yes" ];
  then
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

    break

  # If user input is "no", then skip version control setting
  elif [ $version_control_flag = "no" ];
  then
    echo "Version control hasn't been set!"
    break

  # Ensure user input is either "yes" or "no"
  else
    echo "$version_control_flag"
    echo "Not valid input. Must be either yes or no. TRY again"
    echo "Do you want to set up version control now? [yes/no]"
    read version_control_flag
  fi
done


# create a README.md file and provide some basic guidelines
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

echo " "
echo "******************************************************"
echo "README.md and LICENSE.md are created"

# create directories for data, documentation, source codes, results, and img
mkdir data
mkdir doc
mkdir src
mkdir results
mkdir img

echo " "
echo "******************************************************"
# Interactively creating more sub-folders
echo "Add sub-folders other than ./data, ./doc, ./src, ./results, and ./img? [yes/no]"
read more_folder

while true
do
  # If yes, add a subfolder according to user's input name
  if [ $more_folder = "yes" ];
  then
    # commit and push
    echo "sub-folder name (no space in name, one folder name each time):"
    read subfolder_name
    mkdir $subfolder_name

    echo "Add more sub-folders [yes/no]"
    read more_folder

  # If no, skip
  elif [ $more_folder = "no" ];
  then
    echo "No more sub-folders added!"
    break

  # Ensure user input is either "yes" or "no"
  else
    echo "Not valid input. Must be either yes or no. TRY again"
    echo "Add sub-folders other than data, doc, src, results, and img? [yes/no]"
    read more_folder
  fi
done
echo " "
echo "******************************************************"
echo "All subfolders has been created"


# push new files to github
# make sure github remote has been added
if [ $version_control_flag = "yes" ]; then
  echo " "
  echo "******************************************************"

  # read from user choice
  echo "Do you want to push everything to github now? [yes/no]"
  read push_to_github


  while true
  do
    # if yes, add, commit and push to github repository
    if [ $push_to_github = "yes" ];
    then
      git add .
      git commit -m "First commit"
      git push origin master
      break

    # if no, skip
    elif [ $push_to_github = "no" ];
    then
      echo "No push to github this time!"
      break

    # ensure the user input is either yes or no
    else
      echo "Not valid input. TRY again"
      echo "Do you want to push everything to github now? [yes/no]"
      read push_to_github
    fi
  done

fi
