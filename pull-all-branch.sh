#!/usr/bin/env bash

git branch -r | grep -v '\->' | grep -v 'master' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
git fetch --all
git pull --all
