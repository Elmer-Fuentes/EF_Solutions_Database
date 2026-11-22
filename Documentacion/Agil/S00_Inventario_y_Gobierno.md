# S00 — Inventario y gobierno

**Autor:** Elmer Fuentes  
**Fecha de revisión:** 2026-11-21  
**Estado:** en revisión, con cierre pendiente.

## Inventario y evidencia

| Área | Hallazgo |
| --- | --- |
| Backend | `Backend/EF.Solutions.slnx` contiene los tres proyectos .NET 10. Web referencia Business y Data para composición. Data referencia Business. Business carece de referencias a las otras capas. El controlador de plataforma y el diagnóstico MySQL son los flujos observados. Las carpetas de pruebas contienen marcadores. |
| Frontend | Workspace npm con manifiestos para Admin, EF Personal y Web Pública. Sus carpetas de código contienen marcadores. |
| Database | `MySql/00_Referencia_Fase01` conserva siete scripts: esquema, cinco tablas de identidad, tenants y finanzas, y una validación. PostgreSQL, SQL Server y Oracle tienen carpetas de estructura. |
| Documentacion | Plan, arquitectura y ejemplo de trazabilidad disponibles. El Excel de 213 historias y 18 sprints está en la carpeta local de apoyo. La ruta canónica del Excel citada en el Prompt Maestro no apareció en el inventario. |
| Git y legado | `git status --short --branch` devuelve que la carpeta no pertenece a un repositorio Git. No se encontraron ZIP ni una copia de AppHameIG en el workspace. |

Se añadió la exclusión de `Documentacion/apoyo/` en `.gitignore`. La verificación con `git check-ignore` queda pendiente hasta contar con un checkout Git. La revisión estática de archivos de texto identificó plantillas y código de configuración. El alcance de esa revisión se limita a esta copia y excluye el historial Git.

## Historias de S00

El Excel local registra las nueve historias como **Pendiente**. Esta evaluación registra evidencia y pendientes de la revisión sin modificar esa copia de referencia.

| ID | Evidencia de la revisión | Pendiente |
| --- | --- | --- |
| EF-0001 | Inventario del scaffold y del SQL de referencia | Revisar AppHameIG cuando esté disponible |
| EF-0002 | Tres proyectos, referencias verificadas y compilación correcta | Registrar aprobación de cierre |
| EF-0003 | Cuatro áreas principales en la raíz | Registrar aprobación de cierre |
| EF-0004 | Controladores y carpetas por módulo según el árbol actual | Validar la convención al incorporar casos de negocio |
| EF-0005 | Trazas verificadas a continuación | Extender cada traza cuando exista su cliente React o SQL versionado |
| EF-0006 | Decisiones y riesgos registrados en este documento | Consolidar en el registro maestro |
| EF-0007 | Excel local disponible y resumen comprobado | Confirmar la ubicación del registro maestro |
| EF-0008 | README define tres repositorios, `main`, `develop` y trazabilidad con el mismo ID de historia | Verificar ramas y exclusiones en cada checkout |
| EF-0009 | Hoja `DefinicionHecho` disponible en el Excel | Validar plantillas y evidencias al cierre |

## Trazabilidad comprobada

- HTTP `GET /api/v1/plataforma/estado` → `Web/Controllers/Plataforma/EstadoController.cs::Obtener()` → estado HTTP de la API. La respuesta se construye en Web.
- HTTP `GET /health/database` en Development → `Web/Program.cs` → `Business/Interfaces/Infraestructura/IDatabaseHealthService.cs::VerificarAsync()` → `Data/Connections/MySql/MySqlDatabaseHealthService.cs::VerificarAsync()` → consulta `SELECT 1`. La comprobación con una conexión local inaccesible devolvió HTTP 503.

## Configuración y portabilidad acordadas

- Decisión Git del 2026-11-21. El usuario aprobó repositorios independientes para Backend, Frontend y el conjunto de Database con Documentacion. Esta decisión sustituye la propuesta inicial de monorepositorio registrada en los documentos de referencia. Los nombres del README son propuestos.

- S01 usará dos archivos de perfil. El perfil local cargará `Backend/EF.Solutions.Web/.env` en Development y mantendrá los valores locales fuera de Git. El perfil productivo declarará las variables del servidor y Railway inyectará los valores protegidos, incluidos los de conexión, con TLS `VerifyFull`. QA conservará su configuración protegida y sus credenciales independientes.
- La API ya obtiene los parámetros MySQL de `EF_DATABASE__*`. S01 debe armonizar las plantillas y verificar la configuración efectiva en cada ambiente. El nombre `EF_DEV` de la plantilla y `ef_solutions_dev` del SQL preliminar deben alinearse antes de ejecutar el DDL local.
- En cada cierre de sprint con cambios de persistencia, replicar la lógica aplicable para PostgreSQL, SQL Server y Oracle en las carpetas de sus respectivos motores, agrupada por módulo y tipo de objeto. Usar el dialecto de cada motor, las mismas reglas de aislamiento e integridad, y registrar orden de instalación, validación, reversión viable y evidencia. La compatibilidad de cada motor queda sujeta a pruebas de integración reales.
- Los scripts de referencia no se ejecutaron. Su orden preliminar es esquema, tablas 001–005 y validación. El orden definitivo y la reversión se verificarán con MySQL 8.4 DEV.

## Verificación

| Comprobación | Resultado |
| --- | --- |
| `dotnet sln Backend/EF.Solutions.slnx list` | Tres proyectos. |
| `dotnet build Backend/EF.Solutions.slnx --nologo` | Restauración y compilación correctas con SDK 10.0.302, cero errores y cero advertencias. |
| `dotnet test Backend/EF.Solutions.slnx --no-build --nologo` | La solución carece de proyectos de prueba y no reportó casos ejecutados. |
| Comprobaciones HTTP en loopback | `/health` y `/api/v1/plataforma/estado` devolvieron 200. `/health/database` devolvió 503 con el puerto local de prueba inaccesible. |

La validación positiva contra MySQL 8.4 y el arranque de React son pendientes de S01. El cierre de S00 requiere resolver la ubicación del registro maestro y revisar la evidencia pendiente de Git y del legado.
