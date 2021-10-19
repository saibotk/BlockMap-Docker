FROM docker.io/library/openjdk:17-alpine

ENV VERSION=2.2.1
ENV SHA1=c4ae4900d2b0dbc0744cfde21f5120cdd5c4ae8f

RUN mkdir -p /opt/blockmap /input /output && \
	apk add --update --no-cache su-exec binutils gettext libintl && \
	apk add --update --no-cache --virtual .build-deps curl && \
	curl -sSL https://github.com/Minecraft-Technik-Wiki/BlockMap/releases/download/$VERSION/BlockMap-cli-$VERSION.jar -o /opt/blockmap/blockmap.jar && \
	echo "$SHA1  /opt/blockmap/blockmap.jar" | sha1sum -c && \
	apk del .build-deps curl

COPY files/ /

ENTRYPOINT ["/docker-entrypoint.sh"]
