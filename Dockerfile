FROM golang:1.12-alpine AS build

RUN apk --no-cache add git && \
    go get github.com/adnanh/webhook

FROM alpine:3.9 AS run

COPY --from=build /go/bin/webhook /

RUN apk add --no-cache bash python3 && \
    mkdir /config /scripts && \
    chmod o+rx /config /scripts

USER 1001
EXPOSE 8080

ENTRYPOINT [""]
CMD ["/webhook", "-hotreload", "-verbose", "-port", "8080", "-hooks", "/config/hooks.json"]
