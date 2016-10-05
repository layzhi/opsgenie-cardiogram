FROM alpine:latest

ENV GOPATH /go
ENV APPPATH $GOPATH/src/github.com/lovoo/opsgenie-cardiogram
COPY . $APPPATH
RUN apk add --update -t build-deps go git mercurial libc-dev gcc libgcc \
    && cd $APPPATH && go get -d && go build -o /opsgenie-cardiogram \
    && apk del --purge build-deps && rm -rf $GOPATH

ENTRYPOINT ["/opsgenie-cardiogram"]
