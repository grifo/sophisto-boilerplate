#!/bin/bash
# Update the [gh-pages] branch to include content from
# the public folder and push to [remote].
# 
# https://github.com/hughsk/kss-node/blob/master/gh-pages.sh

# Dependcies: `awk` and `git`, must be run on a Unix system.

cd "$(dirname $0)"

remote=${1-origin}
branch=${2-gh-pages}

$(git branch $branch)

branch_sha=$(git show-ref -s refs/heads/$branch)
echo "$branch last commit: $branch_sha"

tree_sha=$(git ls-tree -d HEAD public | awk '{print $3}')
echo "public/ tree id: $tree_sha"

commit_sha=$(echo "Deploy" | git commit-tree $tree_sha -p $branch_sha)
$(git update-ref refs/heads/$branch $commit_sha)
echo "$branch HEAD updated to $commit_sha"

echo -e "\n\nPushing to $remote..."
$(git push $remote $branch)
exit