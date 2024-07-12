#!/bin/bash

# Variables
NODE_EXPORTER_VERSION="1.8.1"
NODE_EXPORTER_URL="https://github.com/prometheus/node_exporter/releases/download/v${NODE_EXPORTER_VERSION}/node_exporter-${NODE_EXPORTER_VERSION}.linux-arm64.tar.gz"
INSTALL_DIR="/usr/local/bin"
USER="prometheus-node-exporter"
GROUP="prometheus-node-exporter"

# Actualizar el sistema
sudo apt-get update -y
sudo apt-get upgrade -y

# Crear usuario y grupo para node_exporter
sudo useradd --no-create-home --shell /bin/false ${USER}

# Crear directorio temporal para la descarga
TEMP_DIR=$(mktemp -d)
cd ${TEMP_DIR}

# Descargar node_exporter
wget ${NODE_EXPORTER_URL}

# Extraer el archivo descargado
tar -xzf node_exporter-${NODE_EXPORTER_VERSION}.darwin-arm64.tar.gz

# Mover el binario a /usr/local/bin
sudo mv node_exporter-${NODE_EXPORTER_VERSION}.darwin-arm64/node_exporter ${INSTALL_DIR}

# Asignar permisos al binario
sudo chown ${USER}:${GROUP} ${INSTALL_DIR}/node_exporter
sudo chmod 755 ${INSTALL_DIR}/node_exporter

# Limpiar el directorio temporal
cd ~
rm -rf ${TEMP_DIR}

# Crear el archivo de servicio systemd
sudo bash -c 'cat << EOF > /etc/systemd/system/node_exporter.service
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus-node-exporter
Group=prometheus-node-exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=default.target
EOF'

# Recargar los archivos de servicio systemd
sudo systemctl daemon-reload

# Habilitar y iniciar el servicio node_exporter
sudo systemctl enable node_exporter
sudo systemctl start node_exporter

# Confirmar el estado del servicio
sudo systemctl status node_exporter
