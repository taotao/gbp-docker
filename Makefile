# Makefile

PROJ_NAME = gbp-docker

ARCH ?= amd64
DIST ?= stretch

LOCAL_IMAGE_NAME=${PROJ_NAME}:${ARCH}-${DIST}
REMOTE_IMAGE_NAME=${DOCKER_USERNAME}/${LOCAL_IMAGE_NAME}

.PHONY: all build clean

all: build

build: Dockerfile
	docker pull taotaohsu/debian-docker:${ARCH}-${DIST}
	docker build \
		-t ${LOCAL_IMAGE_NAME} \
		--build-arg ARCH=${ARCH} \
		--build-arg DIST=${DIST} \
		.

clean:
	docker rmi ${LOCAL_IMAGE_NAME}
