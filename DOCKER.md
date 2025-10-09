# Docker Setup para DevDocs

Este proyecto incluye configuración Docker optimizada para desarrollo y producción de la documentación.

## Estructura de Archivos Docker

- `Dockerfile` - Multi-stage build para desarrollo y producción
- `docker-compose.yml` - Orquestación de servicios
- `nginx.conf` - Configuración del servidor web para producción
- `.dockerignore` - Archivos excluidos del contexto de build

## Comandos de Uso

### Desarrollo

Para desarrollo con live reload:

```bash
# Iniciar servidor de desarrollo
docker-compose up docs-dev

# Acceder a la documentación
# http://localhost:4567
```

### Construcción y Producción

Para generar la documentación estática:

```bash
# Construir la documentación
docker-compose run --rm docs-build

# Servir con nginx
docker-compose up docs-serve

# Acceder a la documentación
# http://localhost:8080
```

### Comandos Útiles

```bash
# Construir solo la imagen de desarrollo
docker-compose build docs-dev

# Construir solo la imagen de producción  
docker-compose build docs-build

# Ejecutar comandos específicos
docker-compose run --rm docs-dev build
docker-compose run --rm docs-dev serve

# Limpiar volúmenes
docker-compose down -v

# Ver logs
docker-compose logs docs-dev
```

## Características

### Multi-stage Build
- **Base**: Dependencias del sistema y usuario
- **Development**: Dependencias completas + live reload
- **Production**: Solo dependencias de producción + build optimizado

### Optimizaciones
- Cache de dependencias de Ruby y Node.js
- Compresión gzip en nginx
- Headers de seguridad
- Usuario no-root
- Volúmenes optimizados

### Seguridad
- Headers de seguridad HTTP
- Usuario no privilegiado
- Minimización de superficie de ataque

## Troubleshooting

### Permisos
Si tienes problemas de permisos:
```bash
sudo chown -R $USER:$USER .
```

### Cache de dependencias
Para limpiar cache de dependencias:
```bash
docker-compose down
docker system prune -f
docker-compose build --no-cache
```

### Logs detallados
Para ver logs detallados:
```bash
docker-compose up docs-dev --verbose
```