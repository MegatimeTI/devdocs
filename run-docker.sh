#!/bin/bash

# Script para ejecutar la documentación con Docker

echo "🚀 Iniciando documentación Megatime con Docker..."

# Verificar si Docker está disponible
if ! command -v docker &> /dev/null; then
    echo "❌ Docker no está instalado o no está disponible"
    echo "   Instala Docker Desktop y habilita la integración con WSL2"
    exit 1
fi

# Verificar si docker-compose está disponible
if ! command -v docker-compose &> /dev/null; then
    echo "❌ docker-compose no está disponible"
    echo "   Instala docker-compose o usa 'docker compose' en lugar de 'docker-compose'"
    exit 1
fi

echo "📦 Construyendo imagen Docker..."
docker-compose build docs-dev

echo "🔄 Iniciando servidor de desarrollo..."
echo "📖 La documentación estará disponible en: http://localhost:4568"
echo "🛑 Presiona Ctrl+C para detener el servidor"

# Ejecutar en modo desarrollo con hot reload
docker-compose up docs-dev