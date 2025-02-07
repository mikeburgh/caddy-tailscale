
FROM golang:1 AS builder
RUN go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest
ENV XCADDY_SETCAP 0
RUN xcaddy build v2.8.4 --with github.com/tailscale/caddy-tailscale@main --output /usr/bin/caddy

FROM caddy:2.8
COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["/usr/bin/caddy", "run", "--config", "/config/Caddyfile", "--adapter", "caddyfile"]