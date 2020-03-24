#!/bin/bash -eux

if [[ -z $CIRCLE_PULL_REQUEST ]] ; then
    echo "Not a pull request"
else
    echo $CIRCLE_PULL_REQUEST
    FILES_CHANGED="$(git --no-pager diff --name-only FETCH_HEAD $(git merge-base FETCH_HEAD origin/master) '*.md')"
    echo $FILES_CHANGED
fi
