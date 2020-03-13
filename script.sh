#!/bin/bash
shopt -s extglob

echo "Downloading files"
curl -o gitbook_files.zip https://github.com/dhinakg/gitbook-migration/archive/master.zip

echo "Extracting files"
unzip gitbook_files.zip
mv gitbook_files/!(README.md|.travis.yml) .
rm -r gitbook_files.zip gitbook_files

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
