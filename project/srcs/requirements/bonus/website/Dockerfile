ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION}
RUN	apk update && apk upgrade && apk add --no-cache nginx
RUN echo "server {" > /etc/nginx/http.d/default.conf && \
    echo "root    /var/www;" >> /etc/nginx/http.d/default.conf && \
    echo "location / {" >> /etc/nginx/http.d/default.conf && \
    echo "    try_files \$uri /index.html;" >> /etc/nginx/http.d/default.conf && \
    echo "}}" >> /etc/nginx/http.d/default.conf
COPY requirements/bonus/website/conf/* /var/www/
CMD ["nginx", "-g", "daemon off;"]