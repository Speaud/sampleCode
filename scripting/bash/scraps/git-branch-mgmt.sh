UpdateDevelopBranch() {
    git checkout develop
    git pull
    PREV_VERSION_FULL=$(git describe --tags)
    PREV_VERSION_TRIM=$(git describe --tags | sed -E -e 's/\-([[:alnum:]]|\-)*//')
    NEXT_VERSION=$(echo $PREV_VERSION_TRIM | awk -F. -v OFS=. 'NF==1{print ++$NF}; NF>1{if(length($NF+1)>length($NF))$(NF-1)++; $NF=sprintf("%0*d", length($NF), ($NF+1)%(10^length($NF))); print}')
    LAST_COMMIT_HASH=$(git log -n 1 --pretty=format:"%h")
    git tag $NEXT_VERSION $LAST_COMMIT_HASH
    git push origin $NEXT_VERSION
}