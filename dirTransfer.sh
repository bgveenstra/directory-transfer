#!/bin/sh

# Setup:
  # do a chmod 700 <this file name>

# To run this file:
  # ./<this file name>

# Sample Inputs:
  # Clone url of source repo? -> 
	# https://github.com/sf-wdi-22-23/modules-22.git
  # Source directory (relative path *inside* source repo)? -> 
    # w02-working-with-objects/d3-dawn-forms/
  # Clone url of destination repo? -> 
    # https://github.com/bgveenstra/shared_modules.git
  # Destination directory (relative path *inside* destination repo)? -> 
    # 01-front-end-basics/json-and-html-string/22-23

echo "Standing on the shoulders of ..."

printf "\n  Clone url of source repo? -> "
read SOURCE_REPO
printf "  Source directory (relative path *inside* source repo)? -> "
read SOURCE_DIR
printf "  Clone url of destination repo? -> "
read DESTINATION_REPO
printf "  Destination directory (relative path *inside* destination repo)? -> "
read DESTINATION_DIR

echo "\nremoving old directories"
rm -rf tmp-source tmp-destination

echo "\ncloning $SOURCE_REPO into tmp-source"
git clone $SOURCE_REPO tmp-source
if [ ! -d "./tmp-source" ] ; then
    exit 
fi

echo "\ncloning $DESTINATION_REPO into tmp-destination"
git clone $DESTINATION_REPO tmp-destination
if [ ! -d "./tmp-destination" ] ; then
    exit 
fi

echo "\nisolating $SOURCE_DIR, with history"
cd tmp-source
git remote rm origin
if [ ! -d "./$SOURCE_DIR" ] ; then
    echo "\nError: No directory $SOURCE_DIR."
    exit 
fi
git filter-branch --subdirectory-filter $SOURCE_DIR -- --all


echo "\nrenaming to $DESTINATION_DIR"
mkdir -p $DESTINATION_DIR 
mv ./* $DESTINATION_DIR 
echo "commiting change"
git add . --all
git commit -m "isolated $SOURCE_DIR as $DESTINATION_DIR"
# sleep 2s

echo "\npulling source data into destination repo"
cd ../tmp-destination
git checkout -b $DESTINATION_DIR
git remote add tmp-source ../tmp-source
git pull tmp-source master
# sleep 2s

echo "\nremoving temporary source repo"
cd ..
rm -rf tmp-source

echo "\nAll merged and ready to go!\nCheck files in tmp-destination, then push to your new $DESTINATION_DIR branch!"
# echo "\npushing to $DESTINATION_REPO"
# git pull origin $DESTINATION_DIR
# git pull origin master
# git push origin $DESTINATION_DIR
# sleep 2s

# echo "\nremoving temporary destination repo"
# cd ..
# # rm tmp-destination
