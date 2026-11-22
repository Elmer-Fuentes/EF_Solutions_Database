# Ejemplo de trazabilidad — Diagnóstico MySQL

**Autor: Elmer Fuentes** | **Estado: conexión autenticada verificada en DEV**

- **Entrada:** `GET /health/database` en entorno Development.
- **Web:** `Backend/EF.Solutions.Web/Program.cs`: registro `app.MapGet("/health/database", ...)`. Obtiene el servicio por DI y no revela detalles de BD.
- **Business:** `Backend/EF.Solutions.Business/Interfaces/Infraestructura/IDatabaseHealthService.cs`: contrato `VerificarAsync(CancellationToken)`.
- **Data:** `Backend/EF.Solutions.Data/Connections/MySql/MySqlDatabaseHealthService.cs`: clase implementadora, método `VerificarAsync`. Crea conexión mediante valores protegidos y ejecuta `SELECT 1`.
- **SQL:** expresión `SELECT 1` (sin objetos de negocio todavía). No ejecuta migraciones ni modifica tablas.
- **Resultado:** HTTP 200 si conecta, HTTP 503 si no conecta. Solo disponible en Development.
- **Swagger:** en Development, `/swagger/` carga el contrato de `/swagger/v1/swagger.json`. La operación `GET /health/database` documenta HTTP 200 y 503. En la comprobación local, OpenAPI incluyó las tres rutas actuales y cada una devolvió HTTP 200. En Production, la interfaz y el contrato devolvieron HTTP 404.
- **Prueba:** se confirmó MySQL Server 8.4.13 mediante una sesión autenticada en `127.0.0.1:3306`. Se ejecutaron los dos scripts de aprovisionamiento de `EF_DEV` y se verificaron los permisos de lectura de `ef_dev`. La API cargó el `.env` privado y `GET http://127.0.0.1:5257/health/database` devolvió HTTP 200 con `{"status":"ok"}`. La instancia se detuvo al terminar.
- **Evidencia:** la solución compiló con cero advertencias y errores. Con una cuenta de prueba inválida, `/health` devolvió 200 y `/health/database` devolvió 503 en Development. Con perfil Production en loopback, el diagnóstico devolvió 404. Ambas instancias de prueba se detuvieron.

## Aprovisionamiento y prueba local

1. En una sesión administrativa privada sobre `127.0.0.1:3306`, comprobar `SELECT VERSION();` y la existencia de `EF_DEV` en `INFORMATION_SCHEMA.SCHEMATA`.
2. Con autorización para crear objetos locales, ejecutar `Database/MySql/00_Global/01_Esquemas/001_CREAR_EF_DEV.sql` y después `Database/MySql/00_Global/07_DatosIniciales/001_CREAR_USUARIO_EF_DEV.sql`. La cuenta de aplicación tiene permisos de lectura para el esquema. Usar otra cuenta para migraciones. Si `ef_dev` ya existe, revisar sus privilegios y usar su credencial administrada.
3. Desde `Backend/EF.Solutions.Web/`, copiar `.env.example` a `.env` e introducir la contraseña de `ef_dev` en el archivo privado. Ejecutar `dotnet run` y consultar `http://localhost:5257/health/database`. La plantilla local equivalente se encuentra en `Backend/Configuracion/env/.env.local.example`.
4. Registrar el HTTP 200 y detener la API al terminar la prueba. QA y producción usan configuración y credenciales independientes. Para conexiones remotas la API exige `VerifyFull`.

**A partir de Fase 1**, cada operación con datos de negocio debe seguir esta plantilla incluyendo React, DTO, controlador, servicio, repositorio, script SQL y permisos.

## EF-0011 — Estado de plataforma desde Admin

`main.tsx` enlaza la sección de estado. `EstadoApi.tsx::actualizar()` llama a `estadoPlataforma.ts::consultarEstadoPlataforma()`. El proxy DEV de `vite.config.mjs` reenvía la consulta a `EstadoController.cs::Obtener()`. Este endpoint informa el estado de la API sin consultar MySQL. La interfaz presenta un mensaje recuperable si falla la consulta.

Las tres compilaciones TypeScript/Vite pasaron. En Chrome se verificó que el enlace cambia la ubicación a `#estado-api` y que el clic en **Consultar estado** muestra `EF Solutions: disponible` mediante el proxy Vite y la API local.
