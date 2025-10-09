# Docker Desktop Setup for Megatime Docs

## Opción 1: Usar Docker Compose (Recomendado)

### Paso 1: Abrir Docker Desktop
- Asegúrate que Docker Desktop esté ejecutándose en Windows
- Verifica integración WSL habilitada

### Paso 2: Clonar y ejecutar
```bash
# En terminal WSL o PowerShell
cd /mnt/h/github/devdocs
docker-compose up docs-dev
```

### Paso 3: Acceder al sitio
- URL: http://localhost:4568
- El sitio se recarga automáticamente con cambios

## Opción 2: Docker Desktop GUI

### Paso 1: Crear imagen desde Docker Desktop
1. Abre Docker Desktop
2. Ve a "Images" tab
3. Click "Build" > "Browse" 
4. Selecciona la carpeta `/mnt/h/github/devdocs`
5. Tag: `megatime-docs`
6. Build context: `.`
7. Dockerfile: `Dockerfile.simple`

### Paso 2: Ejecutar contenedor
1. En Docker Desktop, ve a "Images"
2. Busca `megatime-docs`
3. Click "Run"
4. Configure:
   - Container name: `megatime-docs-server`
   - Port: `4567:4567`
   - Volumes: `/mnt/h/github/devdocs:/app`
5. Click "Run"

## Opción 3: Comandos directos

```bash
# Build
docker build -t megatime-docs -f Dockerfile.simple .

# Run
docker run -d -p 4567:4567 --name docs-server megatime-docs

# Ver logs
docker logs docs-server

# Detener
docker stop docs-server
```

## URLs de acceso:
- Desarrollo: http://localhost:4568 (docker-compose)
- Manual: http://localhost:4567 (docker run)

## Verificar navegación Rating Radio:
1. Ir a la URL
2. Menu izquierdo → "Rating Radio"
3. Submenús: Autenticación, Crear Rating, Health Check
4. Click "Autenticación" → debe ir a sección correcta