FROM golang:1-alpine

COPY . .
RUN sh build.sh

FROM alpine

WORKDIR /app
COPY --from=0 main . 

EXPOSE 9000
CMD ["./main"]
