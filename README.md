## Feature

- Nezha-agent in container, fully functional with restricted access for safer usage.
- Nezha v1 supported, with minimal config file auto-generated and stored locally.
- Based on Alpine, image size around 40MB, supports linux/amd64 and linux/arm64.

## Usage

- Basic usage example as below: 

```
mkdir /root/cgent
docker run -d -v=/root/cgent/:/root/ \
    --name=cgent --restart=always --net=host --cap-add=NET_RAW \
    -e SECRET=agentsecretkey -e SERVER=installhost -e TLS=true \
    ghcr.io/yosebyte/cgent
cat /root/cgent/config.yml
```

- You shall store or backup `/root/cgent/config.yml` before customizing or upgrading.
- `UUID` varies each time a config file is generated, be sure to backup former `UUID` or `config.yml`.
- `agentsecretkey`, `installhost` and `tls` settings can be found in nezha-dashboard's config file.
- Default `TLS` env setting is `false`, which can be ignored if TLS is disabled by nezha-dashboard.

## Optional
- Optional nezha-dashboard deployment suggested:

```
mkdir /root/nezha
docker run -d -v=/root/nezha/:/dashboard/data/ \
    --name=nezha --restart=always --net=host \
    ghcr.io/nezhahq/nezha
cat /root/nezha/config.yaml
```

- You shall store or backup `/root/nezha/config.yaml`, `/root/nezha/sqlite.db` ,etc before customizing or upgrading. 
