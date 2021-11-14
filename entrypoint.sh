#!/bin/sh
set -e

#entrypoint.sh
if [ "$1" = 'default' ]; then
    # do default thing here
    echo "Running default"
    cd ~/SourceCode
    firebase emulators:start --import=./seed --export-on-exit &
    exec npm run start
elif [ "$1" = 'init' ]; then
# setting up dev environment for the first time
	 echo "Initialize the environment and SourceCode folder"
	 cd ~/SourceCode/
	 npm update
	 tar xvf ~/seed.tar 
else
    echo "Running user supplied arg $1"
    cd ~/SourceCode
    exec npm run $1
fi
