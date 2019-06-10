FROM openjdk:13-alpine

MAINTAINER https://github.com/saibotk/BlockMap-Docker

ARG USER=blockmap
ARG GROUP=blockmap
ARG PUID=844
ARG PGID=844

ENV OUTPUT=/blockmap/output \
	INPUT_OVERWORLD=/blockmap/input/region \
	INPUT_NETHER=/blockmap/input/DIM1/region \
	INPUT_END=/blockmap/input/DIM-1/region \
	VERSION=1.3.0 \
	SHA1=cada13d8c9bba4a8dd1ed3017fd04a4a03695ca3

RUN mkdir -p /opt/blockmap /blockmap && \
	apk add --update --no-cache su-exec binutils gettext libintl && \
	apk add --update --no-cache --virtual .build-deps curl && \
	curl -sSL https://github.com/Minecraft-Technik-Wiki/BlockMap/releases/download/$VERSION/BlockMap-$VERSION.jar -o /opt/blockmap/BlockMap.jar && \
	echo "$SHA1  /opt/blockmap/BlockMap.jar" | sha1sum -c && \
	chmod ugo=rwx /opt/blockmap && \
	ln -s $INPUT_OVERWORLD /opt/blockmap/overworld && \
	ln -s $INPUT_NETHER /opt/blockmap/nether && \
	ln -s $INPUT_END /opt/blockmap/end && \
	ln -s $OUTPUT /opt/blockmap/output && \
	apk del .build-deps && \
	addgroup -g $PGID -S $GROUP && \
	adduser -u $PUID -G $GROUP -s /bin/sh -SDH $USER && \
	chown -R $USER:$GROUP /opt/blockmap /blockmap

COPY files/ /

ENTRYPOINT ["/docker-entrypoint.sh"]
