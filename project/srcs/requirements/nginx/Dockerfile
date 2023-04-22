ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION}
RUN apk update && apk upgrade && apk add nginx && mkdir /usr/share/nginx/www
# RUN rm -rf /etc/nginx/http.d && mkdir /etc/nginx/http.d
COPY ./requirements/nginx/conf/index.conf /etc/nginx/http.d/default.conf
CMD ["nginx", "-g", "daemon off;"]
