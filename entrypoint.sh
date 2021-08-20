#!/bin/sh
set -e

#entrypoint.sh
if [ "$1" = 'default' ]; then
    # do default thing here
    echo "Running default"
    cd ~/SourceCode/c3do-classroom-in-docker/c3do-classroom
    exec npm run start
else
    echo "Running user supplied arg $1"
    cd ~/SourceCode/$1
    exec npm run start
fi
