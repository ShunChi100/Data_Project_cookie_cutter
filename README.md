# Data_Project_cookie_cutter
Generating a template file and directory structure for a data project as outlined in the following
```
├── LICENSE.md         <- LICENSE
├── README.md          <- The top-level README for developers using this project.
├── data/              <- data folder for saving raw data
│
├── docs/              <- Documentation folder
│
├── img/               <- Image folder.
│
├── results/           <- Results folder for saving analysis and results, reports
│
├── src/               <- Source code for use in this project.
│
├── from_joe/          <- Any unstructured inputs/files/emails.
```


### cookie_cutter_simple.sh
Quick create the structure with exact structure as shown above.
Example code:
```
bash cookie_cutter_simple.sh root_directory_name
```
`root_directory_name` is optional. If not provided, its default name `new_project` is used as the new_project root directory name. This code automatically check if the `root_directory_name` exists in the current directory and give you the option (interactively) to remove the existing one and create a new directory.

Directory _project_cookie_ is created as shown in this repo. [Note: empty sub folders are not pushed to github repo but exist in local root directory.]

### cookie_cutter_interactive.sh
Interactively create the file and directory structure based on the structure shown above.
Example code:
```
bash cookie_cutter_interactive.sh root_directory_name
```
`root_directory_name` is optional. If not provided, its default name `new_project` is used as the new_project root directory name.

There are four interactions when running the script:
1. If the `root_directory_name` exists in the current directory, you need to choose interactively, whether or not to remove the existing one and create a new directory. If you choose `no`, the script stops and keeps the existing directory untouched.
2. Setting version control. If you choose `yes`, you need to provide the github repo url you want to use for this project.
3. Adding additional sub-directories. If you choose `yes`, you can add a sub-directory each time (other than provided) and as many times as you want.
4. Push to github repo. This only shows up when you have set version control (see #2 above). If you choose `yes`, it automatically `add .`, `commit -m "First commit"` and `git push` to remote repo.

[An example project directory is created and push to this repo](https://github.com/ShunChi100/Cookie_Cutter_test.git) [Note: empty sub folders are not pushed to github repo but exist in local root directory.]
