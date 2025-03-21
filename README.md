# Cgent - Containerized Nezha-agent

Cgent provides a containerized implementation of Nezha-agent, offering enhanced security through container isolation while maintaining full functionality.

## Features

- **Containerized Security**: Nezha agent runs inside a container with restricted access for enhanced safety
- **Auto-Configuration**: Minimal configuration file automatically generated on first run
- **Nezha v1 Support**: Full compatibility with Nezha monitoring system v1
- **Lightweight**: Based on Alpine Linux, minimal resource usage
- **Multi-Architecture**: Supports both `linux/amd64` and `linux/arm64` platforms

## Quick Start

Create a directory for persistent storage and run the container:

```bash
mkdir -p /root/cgent
docker run -d -v=/root/cgent/:/root/ \
    --name=cgent \
    --restart=always \
    --net=host \
    --cap-add=NET_RAW \
    -e SECRET=agentsecretkey \
    -e SERVER=installhost \
    -e TLS=true \
    ghcr.io/yosebyte/cgent
```

View the generated configuration:

```bash
cat /root/cgent/config.yml
```

## Configuration Options

| Environment Variable | Description | Default |
|---|---|---|
| `SECRET` | Nezha agent secret key from dashboard | *Required* |
| `SERVER` | Nezha dashboard hostname or IP | *Required* |
| `TLS` | Enable/disable TLS connection | `false` |

## Important Notes

- Each time the container creates a new configuration file, a different `UUID` is generated
- Always backup `/root/cgent/config.yml` before upgrading the container
- Find your `SECRET`, `SERVER`, and TLS settings in your Nezha dashboard configuration

## Nezha Dashboard Deployment (Optional)

If you need to deploy a Nezha dashboard as well:

```bash
mkdir -p /root/nezha
docker run -d -v=/root/nezha/:/dashboard/data/ \
    --name=nezha \
    --restart=always \
    --net=host \
    ghcr.io/nezhahq/nezha
```

View the dashboard configuration:

```bash
cat /root/nezha/config.yaml
```

**Important**: Always backup `/root/nezha/config.yaml` and `/root/nezha/sqlite.db` before upgrading the dashboard container.

## About Nezha

Nezha is a server monitoring system that tracks metrics such as CPU, memory, network usage, and more. This containerized agent connects to a Nezha dashboard to report monitoring data from your system.
