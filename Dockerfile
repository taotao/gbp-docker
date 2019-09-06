ARG ARCH
ARG DIST

FROM taotaohsu/debian-docker:${ARCH}-${DIST}
MAINTAINER Taotao Hsu <taotaohsu@gmail.com>

ENV DEBIAN_FRONTEND "noninteractive"
ENV DEBCONF_NONINTERACTIVE_SEEN "true"

RUN \
	apt-get update && \
	apt-get install -y \
		devscripts \
		build-essential \
		git-buildpackage \
		&& \
	apt-get clean && \
	rm -rf /tmp/* /var/lib/apt/lists/*
