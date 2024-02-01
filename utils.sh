VOLUME=shared
ENV_NAME=liggghts-env

echo "Run 'run-docker' to run and attach to the LIGGGHTS docker container."

alias run-docker="docker run -it --rm -v $(pwd)/${VOLUME}:/home/granular/${VOLUME} ${ENV_NAME}"
