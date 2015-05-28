#!/bin/bash

cd ../../
if [ "$TRAVIS" ]; then
  git clone "https://stellar-jenkins@github.com/stellar/docs.git" docs-gh-pages
else
  git clone git@github.com:stellar/docs.git docs-gh-pages
fi
cd docs-gh-pages
git checkout origin/gh-pages
git checkout -b gh-pages
git branch --set-upstream-to=origin/gh-pages
cd ../docs/website