#!/bin/bash

curdir=$(pwd | xargs basename)
gitreponame=$(basename `git rev-parse --show-toplevel`)

if [ "$curdir" = "$gitreponame" ]; then
    sudo find ./ -mindepth 1 ! -regex '^./.git\(/.*\)?' | grep -v '^./.github*' | grep -v './clean.sh' | grep -v './update.sh'  | grep -v './README.md' | grep -v './lastrun' | grep -v './.gitignore' | xargs sudo rm -rf
else
    echo "Error: Set current directory to the repo and then rerun."
    exit 1
fi
