# dirTransfer

Transfer a directory from one repo to another, maintaining the directory's commit history from the original repository.  

DO NOT RUN THIS SCRIPT FROM INSIDE A GIT REPO. 

USE WITH CAUTION. 


## Setup

1. Add `dirTransfer.sh` to a directory of your choice.

1. Make it executable: `chmod 700 dirTransfer.sh`.

1. Recommended: run this file in a directory that is not a git repo, since it does modify history and make commits. 

1. To run the script, `./dirTransfer.sh`.

## Sample Inputs

The script will ask for the source and destination repos and directories. Each directory path should be relative to the root folder of its repo. 

> Clone url of source repo? ->    
>	  https://github.com/sf-wdi-22-23/modules-22.git    
> Source directory (relative path *inside* source repo)? ->    
>   w02-working-with-objects/d3-dawn-forms/    
> Clone url of destination repo? ->     
>   https://github.com/bgveenstra/shared_modules.git    
> Destination directory (relative path *inside* destination repo)? ->     
>   01-front-end-basics/json-and-html-string/22-23    
