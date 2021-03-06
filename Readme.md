# What does it do #
The docker container is built for the purpose of doing development with lit.dev. It includes infrastructure with [Web Dev Server](https://modern-web.dev/docs/dev-server/overview/) and  [Modern Web](https://github.com/modernweb-dev). As the back end, it uses [firebase](https://firebase.google.com/docs/web/setup). To make it easier for development, this package includes setup to use firebase emulator that allows the development to be happened offline. 


# How to build #

Build using regular docker build:
$ docker build -t litdev .

# How to run #

In order to use this container, you need to mount your source code directory (<your_source_code-location> into the user account.
Then you initialize the environment with 'init' argument for the first time.
>`$ docker run -it --mount type=bind,source=<your_source_code_location>,target=/home/kunta/SourceCode litdev init`

Once you initialize it, you can run the regular command after that.
>`docker run -p 8000:8000 -p 4000:4000 -p 9099:9099 -p 9000:9000 -p 9199:9199 -p 9005:9005 -it --mount type=bind,source=<your_source_code_location>,target=/home/kunta/SourceCode litdev`

In order to stop, give Ctrl C or docker stop <container_name> for now.

Verify by using interactive shell
>`docker run -p 8000:8000 -p 4000:4000 -p 9099:9099 -p 9000:9000 -p 9199:9199 -p 9005:9005 -it --mount type=bind,source=<your_source_code_location>,target=/home/kunta/SourceCode --entrypoint /bin/bash litdev`


# To do #

- make the stopping elegant, currently it will throw error.
