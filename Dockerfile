FROM golang:latest AS build

RUN mkdir /app
ADD . /app/
WORKDIR /app
RUN go build -o helloWorld .

FROM golang:latest
RUN mkdir /app $$ useradd -u 1001 -g 0 default
WORKDIR /app
COPY --chown=default:0 --from=build /app/helloWorld /app/helloWorld.go /app/layout.html /app/handler_test.go ./
RUN chmod 777 /app/helloWorld /app
CMD ["/app/helloWorld"]
