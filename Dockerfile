# From https://github.com/jauderho/dockerfiles/blob/main/yt-dlp/Dockerfile

FROM alpine:latest

ARG YTDLP_VERSION=2023.03.03

ENV SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt

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
        && apk del curl \
        && rm -rf /var/cache/apk/*

ENV MPV_ARGS="--ao=alsa --no-video --no-config --really-quiet"
ENV YTDL_ARGS="-g -f 95"

ENTRYPOINT mpv $MPV_ARGS $(yt-dlp $YTDL_ARGS $VIDEO_ID)
