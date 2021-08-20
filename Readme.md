README

Build using regular docker build:
$ docker build -t litelement .

As a default, it will run 'npm run start' from the /home/kunta/SourceCode/c3do-classroom-in-docker/c3do-classroom

docker run -p 8000:8000 -it --mount type=bind,source=/Users/kunta/SourceCode/WebComponent/lit.dev,target=/home/kunta/SourceCode litelement


In order to use a different apps, mount the folder into /home/kunta/SourceCode, then use the folder name as the argument.

docker run -p 8000:8000 -it --mount type=bind,source=/Users/kunta/SourceCode/WebComponent/lit.dev,target=/home/kunta/SourceCode litelement router-app


In order to get into the bash prompt, then need to overwrite the entrypoint

docker run -p 8000:8000 -it --mount type=bind,source=/Users/kunta/SourceCode/WebComponent/lit.dev,target=/home/kunta/SourceCode --entrypoint /bin/bash litelement


In order to stop, give Ctrl C or docker stop <container_name> for now.
TODO: make the stopping elegant, currently it will throw error.
