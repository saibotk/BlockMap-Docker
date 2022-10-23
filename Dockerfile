FROM docker.io/library/openjdk:19-alpine

ENV VERSION=2.4.0
ENV SHA1=05acc7f3e596bc4ce137d2656219d9cff2354a73

RUN mkdir -p /opt/blockmap /input /output && \
	apk add --update --no-cache su-exec binutils gettext libintl && \
	apk add --update --no-cache --virtual .build-deps curl && \
	curl -sSL https://github.com/Minecraft-Technik-Wiki/BlockMap/releases/download/$VERSION/BlockMap-cli-$VERSION.jar -o /opt/blockmap/blockmap.jar && \
	echo "$SHA1  /opt/blockmap/blockmap.jar" | sha1sum -c && \
	apk del .build-deps curl

COPY files/ /

ENTRYPOINT ["/docker-entrypoint.sh"]
