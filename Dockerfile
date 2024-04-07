FROM golang:1.22-alpine as builder

WORKDIR /app

COPY . ./
RUN make install
RUN make build
RUN go build -o /app main.go
RUN > /app/.env

FROM scratch
COPY --from=builder /app /app
COPY --from=builder /app/.env .env

EXPOSE 3000
ENTRYPOINT [ "./app" ]