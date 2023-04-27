ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION}
RUN apk update && apk upgrade && apk add nginx && mkdir /usr/share/nginx/www
RUN wget https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz && \
    tar xvfz node_exporter-1.5.0.linux-amd64.tar.gz
WORKDIR ./node_exporter-1.5.0.linux-amd64

COPY ./requirements/nginx/tools/script.sh .
RUN chmod 777 script.sh

ENTRYPOINT ["./script.sh"]
