FROM python:slim-bookworm

MAINTAINER nili "1791356563@qq.com"

ENV APPATH=${APPATH:-"/github-download-proxy"}

WORKDIR ${APPATH}

COPY ./* ${APPATH}

RUN chmod +x ./* && \
    ./build.sh

ENTRYPOINT ["./start-up.sh"]

EXPOSE 80

CMD ["./start-up.sh"]
