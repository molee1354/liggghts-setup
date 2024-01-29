# Setting up LIGGGHTS

## Steps

- [Install Docker engine](https://docs.docker.com/engine/install/)
- Clone git repo for LIGGGHTS docker setup
- `cd` into the cloned directory
- Build the docker image from the `Dockerfile` using the build command:

```shell
docker build -t $NAME .
```

you can replace `$NAME` with anything else
- After the building is done (this may take a while), attach to the running container:

```shell
docker run -it --rm -v $(pwd)/share:/home/granular/share $NAME
```

This command runs the docker image and attaches an interactive TTY, along with a shared filesystem named `share`.
- Run the following command in the running container to test that `LIGGGHTS` is working properly

```shell
lmp_auto < share/in.testfile
```
