#!/bin/bash
cat > index.html <<EOF
<h1>Hello, World</h1>
<p>cluster_name: ${cluster_name}
<p>db_address: ${db_address}
<p>db_port: ${db_port}
EOF

nohup busybox httpd -f -p ${server_port} &
