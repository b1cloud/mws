#!/bin/bash

##########
# Deploy new version
##########

set -e # Exit on error
#set -x # See what is happening when executing the script.

# Make sure user specifies the new version
if [ $# -ne 1 ]; then
	echo "Please specify the new version."
	echo "Example: ./deploy-new-version.sh 0.0.12"
    exit 1
fi
git pull
git commit -am "Bump plugin version"
git push
git tag -a $1 -m "New version"
git push --tags
