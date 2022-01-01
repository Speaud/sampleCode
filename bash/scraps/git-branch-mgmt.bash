UpdateDevelopBranch() {
    # Prevent this script from running on non feature branches
    #current_branch=$(git rev-parse --abbrev-ref HEAD)
    #[[ $current_branch =~ "develop" ]] || [[ $current_branch =~ "main" ]] && echo "FATAL: You can only run this script on a feature branch"

    # @todo check is the branch exists
    
    #git checkout develop
    #git pull

    PREV_VERSION_FULL=$(git describe --tags)
    # @note if tagging is not initialized the value of `PREV_VERSION_FULL`
    # would be "fatal: No names found, cannot describe anything."
    
    PREV_VERSION_TRIM=$(echo $PREV_VERSION_FULL | sed -E -e 's/\-([[:alnum:]]|\-)*//')
    NEXT_VERSION=$(echo $PREV_VERSION_TRIM | awk -F. -v OFS=. 'NF==1{print ++$NF}; NF>1{if(length($NF+1)>length($NF))$(NF-1)++; $NF=sprintf("%0*d", length($NF), ($NF+1)%(10^length($NF))); print}')
    
    LAST_COMMIT_HASH=$(git log -n 1 --pretty=format:"%h")
    git tag $NEXT_VERSION $LAST_COMMIT_HASH
    git push origin $NEXT_VERSION
}