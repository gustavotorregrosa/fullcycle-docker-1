FROM golang AS build
COPY ./src /go/src
WORKDIR /go/src/
RUN go build -o /server


# FROM gcr.io/distroless/base-debian10
FROM alpine
WORKDIR /
COPY --from=build /server /server
ENTRYPOINT [ "/server" ]