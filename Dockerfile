FROM golang:latest

RUN mkdir /test
ADD . /test/
WORKDIR /test
RUN go build -o helloWorld .

CMD ["/test/helloWorld"]