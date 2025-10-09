#!/bin/bash

echo "🚀 Ejecutando documentación Megatime con docker-compose..."

# Usar docker-compose que ya está configurado
echo "📦 Iniciando con configuración existente..."
echo "📖 Documentación estará en: http://localhost:4568"
echo "🛑 Presiona Ctrl+C para detener"

docker-compose up docs-dev