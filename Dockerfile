FROM python:alpine

ENV YTDLP_VERSION=2023.03.04

RUN apk update \
        && apk add --no-cache \
                mpv \
                alsa-utils \
        && wget -O /usr/local/bin/yt-dlp \
                https://github.com/yt-dlp/yt-dlp/releases/download/${YTDLP_VERSION}/yt-dlp \
        && chmod a+rx /usr/local/bin/yt-dlp \
        && rm -rf /var/cache/apk/*

ENV MPV_ARGS="--ao=alsa --no-video --no-config --really-quiet"
ENV YTDL_ARGS="-g -f 95"

ENTRYPOINT mpv $MPV_ARGS $(yt-dlp $YTDL_ARGS $VIDEO_ID)
