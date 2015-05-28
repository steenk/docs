#!/bin/bash
# Pulls in all content for the developer site, builds, and publishes.
# Must run ./setup.sh before this step.

set -e

# pull in the stellar client tool
git clone git://github.com/stellar/stellar-tutorials.git stellar-tutorials_temporary
mkdir _client
cp -r ./stellar-tutorials_temporary/client/* ./_client
rm -Rf stellar-tutorials_temporary

# build the static site
jekyll build

# remove temporary content folders
rm -Rf _client

# prepare the temp gh-pages folder (must run ./setup.sh before this step)
cd ../../docs-gh-pages
git checkout --
git clean -dfx
git fetch
git rebase
rm -Rf *
cd ../docs/website

# copy built site to gh-pages folder
cp -R _site/* ../../docs-gh-pages/
rm -Rf _site

# publish the site to the gh-pages branch
cd ../../docs-gh-pages
git add --all
git commit -m "update website"
git push
cd ../docs/website