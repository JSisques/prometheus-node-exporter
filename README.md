# 🚀 Prometheus Node Exporter

Prometheus Node Exporter es un proyecto que facilita la exportación de métricas del sistema para su monitoreo con Prometheus.

## 📝 Descripción

Este repositorio contiene un Docker Compose que configura un contenedor para ejecutar Node Exporter, una herramienta para exportar estadísticas del sistema en formato compatible con Prometheus. Además, incluye una carpeta de scripts donde se pueden encontrar instaladores adicionales.

## 🛠️ Instalación

### Requisitos

- Docker
- Docker Compose

### Pasos

1. Clona este repositorio:

```bash
git clone https://github.com/JSisques/prometheus-node-exporter.git
```

2. Navega hasta el directorio del repositorio:

```bash
cd prometheus-node-exporter
```

3. Ejecuta Docker Compose para iniciar Node Exporter:

```bash
docker-compose up -d
```

Esto iniciará el contenedor de Node Exporter en segundo plano.

## 🚀 Uso

Una vez que el contenedor esté en ejecución, puedes acceder a las métricas del sistema a través de Prometheus en la URL http://localhost:9100/metrics.

## 👨‍💻 Autor

- Nombre: Javier Plaza Sisqués
- GitHub: JSisques

## 📄 Scripts Adicionales

En la carpeta `scripts` encontrarás instaladores creados para diferentes configuraciones. Por ejemplo, actualmente incluye:

- `install_linux_arm64.sh`: Instalador para Raspberry Pi (ARM64).

¡Disfruta monitorizando tus sistemas con Prometheus y Node Exporter! 🎉
