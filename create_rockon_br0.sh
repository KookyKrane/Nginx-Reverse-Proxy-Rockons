#!/bin/sh

docker network create -d bridge --subnet=192.168.20.0/24 \
  --gateway=192.168.20.1 \
  -o com.docker.network.bridge.default_bridge=false \
  -o com.docker.network.bridge.enable_icc=true \
  -o com.docker.network.bridge.enable_ip_masquerade=true \
  -o com.docker.network.driver.mtu=1500 \
  -o com.docker.network.bridge.name=docker1 \
  -o com.docker.network.bridge.host_binding_ipv4=0.0.0.0 rockon_br0
