#!/bin/sh
# set -e
git add .
git commit -m "update $(date)"
git push origin master
printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"
hugo
cp -r public/* boojongmin.github.io/
cd boojongmin.github.io
git add .
git commit -m "update $(date)"
git push origin master

