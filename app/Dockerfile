FROM golang:1.23-alpine AS build
WORKDIR /app
COPY main.go go.mod go.sum ./
RUN go build -o main .

FROM scratch
COPY --from=build /app/main /app/main
EXPOSE 8080
CMD ["/app/main"]
