#!/bin/sh
UUID=$(uuidgen)
cat <<EOF > /root/config.yml
client_secret: ${SECRET}
server: ${SERVER}
tls: ${TLS}
uuid: ${UUID}
EOF
exec /cgent -c=/root/config.yml
