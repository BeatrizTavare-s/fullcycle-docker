FROM golang:alpine AS builder

WORKDIR /app

COPY main.go .

RUN go mod init main

RUN go build -o app .

FROM scratch

COPY --from=builder /app/app /

EXPOSE 6111

CMD ["/app"]