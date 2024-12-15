## Feature

- Nezha-agent in container, for safer usage and limited access.
- Nezha v1 supported, minimal config file can be auto-generated.
- Based on Alpine, image size around 40MB, support amd64, arm64.

## Usage

- Use `--net=host --cap-add=NET_RAW` to gain full access of ping and tcping.
- Basic usage example as below: 

```
podman run -d --name=cgent --restart=always --net=host --cap-add=NET_RAW -e SECRET=agentsecretkey -e SERVER=installhost -e TLS=true ghcr.io/yosebyte/cgent
```
- `agentsecretkey` and `installhost` can be found in nezha-dashboard's config.yml, and `-e TLS` should be the same as dash's config, default `TLS` is `false`.
- Optional nezha-dashboard deployment: 
```
mkdir /root/nezha
podman run -d -v=/root/nezha/:/dashboard/data/ --name=nezha --restart=always --net=host ghcr.io/nezhahq/nezha
cat /root/nezha/config.yaml
```