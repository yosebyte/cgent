FROM golang AS builder
WORKDIR /root
RUN git clone https://github.com/nezhahq/agent
WORKDIR /root/agent/cmd/agent
RUN env CGO_ENABLED=0 \
    go build -v -trimpath -ldflags \
    "-s -w -X github.com/nezhahq/agent/pkg/monitor.Version=1.6.1"
FROM alpine
RUN apk add --no-cache util-linux
COPY --from=builder /root/agent/cmd/agent/agent /cgent
ENV SECRET=default_secret \
    SERVER=default_server \
    TLS=false
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
