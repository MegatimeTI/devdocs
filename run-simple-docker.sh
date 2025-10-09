#!/bin/bash

echo "🚀 Iniciando documentación con Docker simple..."

# Construir imagen simple
echo "📦 Construyendo imagen..."
docker build -t megatime-docs -f Dockerfile.simple .

# Ejecutar contenedor
echo "🔄 Iniciando servidor..."
echo "📖 Documentación disponible en: http://localhost:4567"
echo "🛑 Presiona Ctrl+C para detener"

docker run -it --rm \
  -p 4567:4567 \
  -v "$(pwd):/app" \
  megatime-docs