#!/bin/bash
shopt -s extglob

echo "Downloading files"
git clone https://github.com/dhinakg/gitbook-migration.git

echo "Moving files"
mv gitbook-migration/!(README.md|.git) .
rm -rf gitbook-migration

echo "Installing dependencies"
npm install -g gitbook-cli
gitbook install

echo "Building"
gitbook build

if [ -d "icons" ]
then
  echo "Copying icons"
  cp icons/* _book/gitbook/images
fi
