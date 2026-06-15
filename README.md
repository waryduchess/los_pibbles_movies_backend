# Los Pibbles Movies Backend

Este repositorio configura un contenedor MySQL y phpMyAdmin para tu backend.

## Requisitos

- Docker
- Docker Compose

## Arrancar la base de datos

1. Desde la carpeta del proyecto:

```bash
docker compose up -d
```

2. Verifica que los servicios estén arrancados:

```bash
docker compose ps
```

## Acceder a la base de datos

- phpMyAdmin: `http://localhost:8080`
- Usuario: `admin`
- Contraseña: `los_pibbles_movies`
- Servidor MySQL: `mysql`

## Detalles de la configuración

- Servicio MySQL: `mysql`
- Puerto MySQL expuesto: `3306`
- Volumen de datos: `mysql_data`
- Script de inicialización: `./db/init.sql`

## Reiniciar cuando cambies el esquema

Si necesitas recrear la base de datos desde cero y volver a ejecutar `init.sql`:

```bash
docker compose down -v

docker compose up -d
```

## Notas

- El script `db/init.sql` se ejecuta solo la primera vez que se crea el volumen de datos.
- El proyecto usa TMDB para obtener la información completa de las películas, por lo que `id_pelicula` se guarda localmente y el resto de los datos se obtiene desde la API.
