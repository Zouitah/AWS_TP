#!/bin/bash

apt update -y
apt install -y haproxy

cat << EOF >> /etc/haproxy/haproxy.cfg

frontend web_server
	bind *:80
	use_backend web_backend

backend web_backend
EOF

for (( i=4 ; i < ((<##NB_INSTANCE##>+4)) ; i++ ))
do
	cat << EOF >> /etc/haproxy/haproxy.cfg
	server bckend$(($i-3)) 10.0.2.${i}:80
EOF
done

systemctl restart haproxy
