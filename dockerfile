# syntax=docker/dockerfile:1

# build stage

FROM golang:1.19.3-alpine AS builder

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY . . 

RUN go build -o /pathapp

# run stage 

WORKDIR /app

FROM alpine:3.17.0

COPY --from=builder pathapp .



EXPOSE 8080

USER 10014

CMD [ "/pathapp" ]
