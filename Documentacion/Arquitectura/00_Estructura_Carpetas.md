# Organización aprobada — EF Solutions

**Autor:** Elmer Fuentes  
**Fecha:** 2026-11-21

El espacio de trabajo tiene cuatro áreas de primer nivel: `Backend`, `Frontend`, `Database` y `Documentacion`. Mantenerlas directamente dentro de `EF_Solutions`.

## Backend

`Backend/EF.Solutions.slnx` es la solucion unica de .NET. Sus tres proyectos reales son `Backend/EF.Solutions.Web`, `Backend/EF.Solutions.Business` y `Backend/EF.Solutions.Data`. Las dependencias y responsabilidades estan descritas en `Backend/README.md`. `Backend/Tests` y `Backend/Configuracion` pertenecen al area de backend.

## Frontend

`Frontend/package.json` administra tres aplicaciones futuras con npm workspaces: `ef-solutions-admin`, `ef-personal` (incluyendo su futuro `android/` de Capacitor), y `ef-public-web`. Ninguna esta implementada aun.

## Database

`Database/MySql` contiene los scripts preliminares iniciales. Las demas carpetas indican motores futuros, no compatibilidad terminada.

## Documentacion

Centraliza el plan maestro, especificaciones, trazabilidad y manuales, con autor Elmer Fuentes y rutas exactas.

## Git

GitHub contiene tres repositorios independientes: `EF_Solutions_Backend`, `EF_Solutions_Frontend` y `EF_Solutions_Database`. El tercero contiene las carpetas hermanas `Database/` y `Documentacion/`. Los cambios que abarcan varios repositorios comparten el ID de historia y enlazan sus revisiones y pruebas.

## Antes de aplicar cambios

Verificar rutas y referencias, compilar el backend, revisar contratos del frontend, ejecutar scripts solo en EF_DEV, actualizar documentos y no subir secretos.
