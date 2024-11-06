## Feature

- Nezha-agent in container, for safer usage and limited access, based on Alpine, image size less than 30MB.

## Usage

- Use `--net=host --cap-add=NET_RAW` to gain full access of ping and tcping.

- Basic usage example as below. 

```
podman run -d --name=cgent --restart=always --net=host --cap-add=NET_RAW ghcr.io/yosebyte/cgent -s DASH_ADDR -p SECRET
```
