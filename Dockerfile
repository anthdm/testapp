FROM golang:1.22-alpine as builder

WORKDIR /app

COPY . ./
RUN go build -o /test-app main.go
RUN > /app/.env

FROM scratch
COPY --from=builder /test-app /test-app
COPY --from=builder /app/.env .env

EXPOSE 3000
ENTRYPOINT [ "./test-app" ]