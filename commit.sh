#!/bin/sh


# If a command fails then the deploy stops
#set -e

git add .

git commit -m "update $(date)"

git push origin master

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"


