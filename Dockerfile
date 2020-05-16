FROM golang:alpine AS builder

RUN apk add --no-cache git

RUN go get github.com/garrettsparks/watismyip

FROM alpine

COPY --from=builder /go/bin/watismyip /go/bin/watismyip

ENTRYPOINT ["/go/bin/watismyip"]

