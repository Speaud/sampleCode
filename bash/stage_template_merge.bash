#!/bin/bash

TEMPLATE_REPO_NAME=parent-template-remote

if [[ $(basename `git rev-parse --show-toplevel`) == $TEMPLATE_REPO_NAME ]]; then
    echo "ERROR: This script will not run in the repo "$TEMPLATE_REPO_NAME
    echo "ERROR: This script is only used to pull down changes from the "$TEMPLATE_REPO_NAME
    exit 1
fi

REMOTE_ALIAS=parent-template-remote
REMOTE_URL="<git url>"
FEATURE_BRANCH=feature/template-update

# Checkout develop and make sure it is up-to-date
git checkout develop
git pull

# Create a feature branch to merge in template changes
git checkout -b $FEATURE_BRANCH
git push --set-upstream origin $FEATURE_BRANCH

# Remove the remote alias if it already exists
[[ $(git remote -v | grep $REMOTE_ALIAS | wc -l) -eq 2 ]] && git remote rm $REMOTE_ALIAS

# Add the remote alias
git remote add $REMOTE_ALIAS $REMOTE_URL

# Fetch the template repo without tags
# We do not fetch the template repo tags because each repo has it's own tags
# and we do not want to overwrite them
git fetch --no-tags $REMOTE_ALIAS

# Stage the merge by pulling in template changes
git merge $REMOTE_ALIAS/main --allow-unrelated-histories
