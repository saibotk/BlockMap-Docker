FROM docker.io/library/openjdk:17-alpine

ENV VERSION=2.3.0
ENV SHA1=c9bb6395a8d920dd0ce39ff985325390061c6ea2

RUN mkdir -p /opt/blockmap /input /output && \
	apk add --update --no-cache su-exec binutils gettext libintl && \
	apk add --update --no-cache --virtual .build-deps curl && \
	curl -sSL https://github.com/Minecraft-Technik-Wiki/BlockMap/releases/download/$VERSION/BlockMap-cli-$VERSION.jar -o /opt/blockmap/blockmap.jar && \
	echo "$SHA1  /opt/blockmap/blockmap.jar" | sha1sum -c && \
	apk del .build-deps curl

COPY files/ /

ENTRYPOINT ["/docker-entrypoint.sh"]
