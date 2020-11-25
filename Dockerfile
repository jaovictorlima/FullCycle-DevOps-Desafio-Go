FROM golang:alpine as build
WORKDIR /go
COPY main.go .
RUN go build -ldflags "-s -w" main.go

FROM scratch
WORKDIR /usr/home/app
COPY --from=build /go/main .
CMD ["./main"]  