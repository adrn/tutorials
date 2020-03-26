#!/bin/bash -eux

if [[ -z $CIRCLE_PULL_REQUEST ]] ; then
    echo "Not a pull request: pushing website to gh-pages branch."
    git clone git@github.com:adrn/tutorials.git gh-pages
    cd gh-pages
    git checkout --orphan gh-pages
    rm -rf .
    cp ../_build/* ./
    cp ../.gitignore ./
    cp -R ../_static ./
    git add .
    touch .nojekyll
    git add .nojekyll
    git status
    git -c user.name='circle' -c user.email='circle' commit -m "Upadate the build docs"
    git status
    git push -qf origin gh-pages
else
    echo $CIRCLE_PULL_REQUEST
    echo "This is a pull request: Not pushing to gh-pages!"
fi
