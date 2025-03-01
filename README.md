## Feature

- Nezha-agent in container, fully functional with restricted access for safer usage.
- Nezha v1 supported, with minimal config file auto-generated.
- Based on Alpine, supports linux/amd64 and linux/arm64.

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

- `UUID` varies each time a config file is generated, backup `/root/cgent/config.yml` before upgrading.
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

- Backup `/root/nezha/config.yaml` and `/root/nezha/sqlite.db` before upgrading.
