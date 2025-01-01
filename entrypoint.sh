#!/bin/sh
CONFIG_FILE="/root/config.yml"
if [ ! -f "$CONFIG_FILE" ]; then
    UUID=$(uuidgen)
    cat <<EOF > "$CONFIG_FILE"
client_secret: ${SECRET}
server: '${SERVER}'
tls: ${TLS}
uuid: ${UUID}
EOF
fi
exec /cgent -c="$CONFIG_FILE"
