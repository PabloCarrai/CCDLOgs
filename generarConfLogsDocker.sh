#!/bin/bash

ARCH="/etc/docker/daemon.json"

# Contenido que deseas escribir en daemon.json
CONFIG='{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "3"
  }
}'

if [ -f "$ARCH" ]; then
  # el archivo existe
  echo "El archivo existe, me hago el vago"  
else
  echo "$CONFIG" | sudo tee "$ARCH" >/dev/null
  systemctl restart docker
  echo "Configuracion de logs de docker, lista"
fi
