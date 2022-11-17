#!/bin/bash

DIR_PATH=$(realpath $(dirname ${BASH_SOURCE[0]}))
GITROOT=`git -C $DIR_PATH rev-parse --show-toplevel`

target_merge_branch=$1
# Use the default branch : devel
if [[ -z "$1" ]]; then
  target_merge_branch='devel'
fi

changed_files=$(git --no-pager diff --name-only FETCH_HEAD $(git merge-base FETCH_HEAD $target_merge_branch))
#echo $changed_files
for f in $changed_files
do
  echo $f
done
