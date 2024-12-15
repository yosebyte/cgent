## Feature

- Nezha-agent in container, for safer usage and limited access.
- Nezha v1 supported, minimal config file can be auto-generated.
- Based on Alpine, image size less than 30MB.

## Usage

- Use `--net=host --cap-add=NET_RAW` to gain full access of ping and tcping.

- Basic usage example as below. 

```
podman run -d --name=cgent --restart=always --net=host --cap-add=NET_RAW -e SECRET=agentsecretkey -e SERVER=installhost -e TLS=true ghcr.io/yosebyte/cgent
```
- `agentsecretkey` and `installhost` can be found in nezha-dashboard's config.yml, and `-e TLS` should be the same as dash's config, default for cgent is `false`.
