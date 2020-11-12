#!/bin/sh

# Go To Public folder
rm -rf public

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public

#echo "blog.boojongmin.com" > CNAME

# Add changes to git.
git init

git add .

git remote add origin https://github.com/boojongmin/boojongmin.github.io.git

git commit -m "update"

# Push source and build repos.
git push origin master --force

