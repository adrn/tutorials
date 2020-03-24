#!/bin/bash -eux

if [[ -z $CIRCLE_PULL_REQUEST ]] ; then
    echo "This is not a pull request"
else
    echo "This is a pull request: $CIRCLE_PULL_REQUEST"
    export TUTORIALS_FILES_CHANGED="$(git --no-pager diff --name-only FETCH_HEAD $(git merge-base FETCH_HEAD origin/master) '*.ipynb')"

    if [[ -z $TUTORIALS_FILES_CHANGED ]] ; then
        echo "No notebook files have been modified."
    else
        echo "Modified notebook files: $TUTORIALS_FILES_CHANGED"
    fi
fi
