FROM golang AS builder

WORKDIR usr/src/app

COPY ./printWithGo.go .

RUN GOOS=linux GOARCH=amd64 go build printWithGo.go


FROM scratch
COPY --from=builder /go/usr/src/app/printWithGo .

CMD ["/printWithGo"]
