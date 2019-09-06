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

upload:
	docker tag \
		${LOCAL_IMAGE_NAME} \
		${REMOTE_IMAGE_NAME}
	@echo ${DOCKER_PASSWORD} | docker login -u ${DOCKER_USERNAME} --password-stdin
	docker push ${REMOTE_IMAGE_NAME}
	@docker logout

clean:
	docker rmi ${LOCAL_IMAGE_NAME}
