#!/bin/bash -eux

if [[ -z $CIRCLE_PULL_REQUEST ]] ; then
    echo "Not a pull request: pushing website to gh-pages branch."
    git clone --single-branch -b gh-pages git@github.com:adrn/tutorials.git gh-pages
    cp -r _build/* gh-pages
    cp .gitignore gh-pages/
    cp -R .circleci gh-pages/
    cd gh-pages
    git add .
    touch .nojekyll
    git add .nojekyll
    git status
    git -c user.name='circle' -c user.email='circle' commit -m "Upadate the build docs"
    git status
    git push -q origin gh-pages
else
    echo $CIRCLE_PULL_REQUEST
    echo "This is a pull request: Not pushing to gh-pages!"
fi
