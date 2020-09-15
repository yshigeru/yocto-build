#!/bin/bash

WRLBUILD_CONTAINER_NAME=yocto-build
WRLBUILD_CONTAINER_TAG=latest
WRLBUILD_SHELL=bash

while getopts c:t:s: opt; do
	case $opt in
	c)
		WRLBUILD_CONTAINER_NAME=$OPTARG
		;;
	t)
		WRLBUILD_CONTAINER_TAG=$OPTARG
		;;
	s)
		WRLBUILD_SHELL=$OPTARG
		;;
	esac
done

exec docker run -it --rm -v /home:/home -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro -u $(id -u $USER):$(id -g $USER) -h yocto-build -w /home/$USER $WRLBUILD_CONTAINER_NAME:$WRLBUILD_CONTAINER_TAG $WRLBUILD_SHELL
