FROM golang:1-alpine

WORKDIR /build
COPY . .
RUN sh build.sh

FROM alpine

WORKDIR /app
COPY --from=0 /build/main . 

EXPOSE 9000
CMD ["./main"]
