# From https://github.com/jauderho/dockerfiles/blob/main/yt-dlp/Dockerfile
FROM alpine:latest

ARG YTDL_VERSION=2022.06.29

RUN apk update \
	&& apk add --no-cache \
		ca-certificates \
		curl \
		python3 \
		mpv \
		alsa-utils \
 # Install youtube-dl
 && curl -s -L -o /usr/local/bin/yt-dlp \
 	https://github.com/yt-dlp/yt-dlp/releases/download/${YTDL_VERSION}/yt-dlp \
 && chmod a+rx /usr/local/bin/yt-dlp \
 && ln -s /usr/bin/python3 /usr/bin/python \
 && apk del curl

ENV SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt

ENV MPV_ARGS="--ao=alsa --no-video --no-config --really-quiet"
ENV YTDL_ARGS="-g -f 95"

ENTRYPOINT mpv $MPV_ARGS $(yt-dlp $YTDL_ARGS $VIDEO_ID)
