#!/bin/bash

# Script para construir la documentación en modo producción

echo "🏗️  Construyendo documentación en modo producción..."

# Construir imagen de producción
docker-compose build docs-build

# Ejecutar build
docker-compose run --rm docs-build

echo "✅ Build completado!"
echo "📁 Los archivos están en la carpeta ./build"

# Opcional: servir con nginx
read -p "¿Quieres servir la documentación con nginx? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "🌐 Iniciando servidor nginx..."
    echo "📖 La documentación estará disponible en: http://localhost:8080"
    docker-compose up docs-serve
fi