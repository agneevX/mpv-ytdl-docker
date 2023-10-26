FROM python:alpine

ENV YTDLP_VERSION=2023.10.13

RUN apk update \
        && apk add --no-cache mpv alsa-utils \
        && rm -rf /var/cache/apk/*

RUN wget -O /usr/local/bin/yt-dlp \
                https://github.com/yt-dlp/yt-dlp/releases/download/${YTDLP_VERSION}/yt-dlp \
        && chmod a+rx /usr/local/bin/yt-dlp

ENTRYPOINT ["mpv"]
CMD ["--help"]
