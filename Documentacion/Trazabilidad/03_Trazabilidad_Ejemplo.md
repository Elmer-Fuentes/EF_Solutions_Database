# Ejemplo de trazabilidad — Diagnóstico MySQL

**Autor: Elmer Fuentes** | **Estado: implementado como scaffold (sin compilación verificada)**

- **Entrada:** `GET /health/database` en entorno Development.
- **Web:** `Backend/EF.Solutions.Web/Program.cs`: registro `app.MapGet("/health/database", ...)`. Obtiene el servicio por DI y no revela detalles de BD.
- **Business:** `Backend/EF.Solutions.Business/Interfaces/Infraestructura/IDatabaseHealthService.cs`: contrato `VerificarAsync(CancellationToken)`.
- **Data:** `Backend/EF.Solutions.Data/Connections/MySql/MySqlDatabaseHealthService.cs`: clase implementadora, método `VerificarAsync`. Crea conexión mediante valores protegidos y ejecuta `SELECT 1`.
- **SQL:** expresión `SELECT 1` (sin objetos de negocio todavía). No ejecuta migraciones ni modifica tablas.
- **Resultado:** HTTP 200 si conecta, HTTP 503 si no conecta. Solo disponible en Development.
- **Prueba:** pendiente en máquina con SDK .NET 10 y MySQL instalado.

**A partir de Fase 1**, cada operación con datos de negocio debe seguir esta plantilla incluyendo React, DTO, controlador, servicio, repositorio, script SQL y permisos.
