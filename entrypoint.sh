#!/bin/sh
UUID=$(uuidgen)
cat <<EOF > /config.yml
client_secret: ${SECRET}
server: ${SERVER}
tls: ${TLS}
uuid: ${UUID}
EOF
exec /cgent
