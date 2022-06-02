FROM jauderho/yt-dlp:latest

RUN apk add --no-cache mpv alsa-utils

ENV MPV_ARGS="--ao=alsa --no-video --no-config --really-quiet"
ENV YTDL_ARGS="-g -f 95"

ENTRYPOINT dumb-init mpv $MPV_ARGS $(yt-dlp $YTDL_ARGS $VIDEO_ID)
