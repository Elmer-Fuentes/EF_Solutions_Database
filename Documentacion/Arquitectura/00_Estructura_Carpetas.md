# Organización aprobada — EF Solutions

**Autor:** Elmer Fuentes  
**Fecha:** 2026-11-21

El repositorio tiene cuatro areas de primer nivel: `Backend`, `Frontend`, `Database`, `Documentacion`. No mantener una carpeta `EF_Solutions` adicional dentro de ellas.

## Backend

`Backend/EF.Solutions.slnx` es la solucion unica de .NET. Sus tres proyectos reales son `Backend/EF.Solutions.Web`, `Backend/EF.Solutions.Business` y `Backend/EF.Solutions.Data`. Las dependencias y responsabilidades estan descritas en `Backend/README.md`. `Backend/Tests` y `Backend/Configuracion` pertenecen al area de backend.

## Frontend

`Frontend/package.json` administra tres aplicaciones futuras con npm workspaces: `ef-solutions-admin`, `ef-personal` (incluyendo su futuro `android/` de Capacitor), y `ef-public-web`. Ninguna esta implementada aun.

## Database

`Database/MySql` contiene los scripts preliminares iniciales. Las demas carpetas indican motores futuros, no compatibilidad terminada.

## Documentacion

Centraliza el plan maestro, especificaciones, trazabilidad y manuales, con autor Elmer Fuentes y rutas exactas.

## Git

Un repositorio GitHub con ramas por cambio o funcionalidad, no una rama permanente por carpeta. Un PR puede tocar varias areas cuando un requerimiento lo exija, pero el responsable registra archivos y pruebas.

## Antes de aplicar cambios

Verificar rutas y referencias, compilar el backend, revisar contratos del frontend, ejecutar scripts solo en EF_DEV, actualizar documentos y no subir secretos.
