ARG VERSION=3.17.3
FROM alpine:$VERSION
RUN apk update && apk upgrade && apk add nginx

RUN rm -rf /var/lib/nginx/html/index.html
COPY ./conf/index.html /var/lib/nginx/html

RUN rm -rf /etc/nginx/http.d/ && mkdir /etc/nginx/http.d
COPY ./conf/index.conf /etc/nginx/http.d/

COPY ./conf/run.sh .

CMD ["nginx", "-g", "daemon off;"]
