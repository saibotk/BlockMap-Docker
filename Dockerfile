FROM docker.io/library/openjdk:14-alpine

ENV VERSION=2.1.0 \
	SHA1=47de080154f4562dc1601d23b58a12e790ec9fa5

RUN mkdir -p /opt/blockmap /input /output && \
	apk add --update --no-cache su-exec binutils gettext libintl && \
	apk add --update --no-cache --virtual .build-deps curl && \
	curl -sSL https://github.com/Minecraft-Technik-Wiki/BlockMap/releases/download/$VERSION/BlockMap-cli-$VERSION.jar -o /opt/blockmap/blockmap.jar && \
	echo "$SHA1  /opt/blockmap/blockmap.jar" | sha1sum -c && \
	apk del .build-deps curl

COPY files/ /

ENTRYPOINT ["/docker-entrypoint.sh"]
