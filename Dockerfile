FROM golang AS builder
WORKDIR /root
RUN git clone https://github.com/nezhahq/agent
WORKDIR /root/agent/cmd/agent
RUN env CGO_ENABLED=0 go build -v -trimpath -ldflags '-w -s -X main.version=0.20.3'
FROM alpine
COPY --from=builder /root/agent/cmd/agent/agent /cgent
ENTRYPOINT ["/cgent"]
