#!/bin/bash

CUR_DIR=$(pwd)

echo "Enter reps"

for i in $(find . -name ".git" | cut -c 3-); do
    echo "";
    echo "****$i****";

    cd "$i";
    cd ..;

    git pull origin master;

    cd $CUR_DIR
done
echo "DONE pull"
