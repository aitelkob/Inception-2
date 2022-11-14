FROM alpine:3.16

ARG UID GID
RUN addgroup -g $GID nginx
RUN adduser -D -u $UID -G nginx nginx
RUN apk update && apk upgrade && apk add --no-cache nginx
USER nginx

EXPOSE 443
CMD ["nginx","-g","daemon off;"]

