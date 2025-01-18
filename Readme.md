# Caddy Tailscale

Nothing fancy, Caddy to Tailscale, using https://github.com/tailscale/caddy-tailscale

The docker file comes from: 
https://github.com/tailscale/caddy-tailscale/issues/34#issuecomment-2145764893

The container expects a config named Caddyfile mounted into 

/config

Sample Caddy file to reverse proxy a local network service

```
:443 {
  bind tailscale/caddytest
  tls {
    get_certificate tailscale
  }
  reverse_proxy 192.168.0.1:80 {
  }
}
```

Run it

```bash
docker run --name caddy-tailscale -v $(pwd):/config  -d mikeburgh/caddy-tailscale

```

On first run, check the logs for a url to auth with tailscale.