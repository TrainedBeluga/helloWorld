FROM golang:latest AS build

RUN mkdir /app
ADD . /app/
WORKDIR /app
RUN go build -o helloWorld .

FROM golang:latest
RUN mkdir /app
WORKDIR /app
COPY --from=build /app/helloWorld /app/helloWorld.go /app/layout.html /app/handler_test.go ./
CMD ["/app/helloWorld"]