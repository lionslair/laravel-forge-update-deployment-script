FROM alpine:3.17.2

RUN apk add --no-cache curl jq

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
