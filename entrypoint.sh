#!/bin/sh
UUID=$(uuidgen)
cat <<EOF > /root/config.yml
client_secret: ${SECRET}
server: ${SERVER}
tls: ${TLS}
uuid: ${UUID}
EOF
exec /root/cgent
