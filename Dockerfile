FROM golang:1.16 AS build
ADD . /src
WORKDIR /src
RUN go test --cover -v ./...
RUN go build -v -o demo



FROM alpine:3.4
EXPOSE 8080
CMD ["demo"]
COPY --from=build /src/demo /usr/local/bin/demo
RUN chmod +x /usr/local/bin/demo
