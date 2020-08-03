FROM docker.io/library/openjdk:14-alpine

ENV VERSION=2.2.0 \
	SHA1=bcb3a1eec9deddc77e2ed2d4df1b402fa6432beb

RUN mkdir -p /opt/blockmap /input /output && \
	apk add --update --no-cache su-exec binutils gettext libintl && \
	apk add --update --no-cache --virtual .build-deps curl && \
	curl -sSL https://github.com/Minecraft-Technik-Wiki/BlockMap/releases/download/$VERSION/BlockMap-cli-$VERSION.jar -o /opt/blockmap/blockmap.jar && \
	echo "$SHA1  /opt/blockmap/blockmap.jar" | sha1sum -c && \
	apk del .build-deps curl

COPY files/ /

ENTRYPOINT ["/docker-entrypoint.sh"]
