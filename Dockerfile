FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add --no-cache sqlite

COPY backup.sh /backup.sh

CMD ["/backup.sh"]