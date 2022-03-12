FROM golang:alpine AS builder
WORKDIR /app
COPY app.go .
RUN CGO_ENABLED=0 go build -o /app app.go

FROM scratch
WORKDIR /app
COPY --from=builder /app .
CMD [ "./app" ]
