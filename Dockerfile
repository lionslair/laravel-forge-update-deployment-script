FROM alpine:3.18.0

RUN apk add --no-cache curl jq

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
