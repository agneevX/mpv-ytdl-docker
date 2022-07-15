# From https://github.com/jauderho/dockerfiles/blob/main/yt-dlp/Dockerfile

FROM alpine:latest

ARG YTDLP_VERSION=2022.06.29

RUN apk update \
	&& apk add --no-cache \
		ca-certificates \
		curl \
		python3 \
		mpv \
		alsa-utils \
	&& curl -s -L -o /usr/local/bin/yt-dlp \
 		https://github.com/yt-dlp/yt-dlp/releases/download/${YTDLP_VERSION}/yt-dlp \
	&& chmod a+rx /usr/local/bin/yt-dlp \
	&& ln -s /usr/bin/python3 /usr/bin/python \
	&& apk del curl \
	&& rm -rf /var/cache/apk/*

CMD mpv
