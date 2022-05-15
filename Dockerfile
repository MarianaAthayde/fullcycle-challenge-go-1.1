FROM golang:1.18-alpine AS build


WORKDIR /usr/src/app
RUN go mod init example/hello

COPY helloWorld.go .
RUN go build

FROM scratch
COPY --from=build /usr/src/app/hello /usr/src/app/
WORKDIR /usr/src/app
ENTRYPOINT [ "./hello"]