ARG VERSION=3.17.3
FROM alpine:$VERSION
RUN apk update && apk upgrade && apk add nginx
CMD ["nginx", "-g", "daemon off;"]
