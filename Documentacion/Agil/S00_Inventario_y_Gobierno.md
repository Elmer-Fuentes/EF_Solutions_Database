# S00 — Inventario y gobierno

**Autor:** Elmer Fuentes  
**Fecha de revisión:** 2026-11-21  
**Estado:** completado, 9 de 9 historias.

## Inventario y evidencia

| Área | Hallazgo |
| --- | --- |
| Backend | `Backend/EF.Solutions.slnx` contiene los tres proyectos .NET 10. Web referencia Business y Data para composición. Data referencia Business. Business carece de referencias a las otras capas. El controlador de plataforma y el diagnóstico MySQL son los flujos observados. Las carpetas de pruebas contienen marcadores. |
| Frontend | Workspace npm con manifiestos para Admin, EF Personal y Web Pública. Sus carpetas de código contienen marcadores. |
| Database | `MySql/00_Referencia_Fase01` conserva siete scripts: esquema, cinco tablas de identidad, tenants y finanzas, y una validación. PostgreSQL, SQL Server y Oracle tienen carpetas de estructura. |
| Documentacion | Plan, arquitectura y ejemplo de trazabilidad disponibles. El Excel de 213 historias y 18 sprints está en la carpeta local de apoyo. La ruta canónica del Excel citada en el Prompt Maestro no apareció en el inventario. |
| Git y legado | Se publicaron los tres repositorios con `main` y `develop`. La revisión local confirmó ambas referencias de seguimiento en cada checkout. En el inventario inicial no se encontró una copia de AppHameIG. |

Se verificó con `git check-ignore` que el Excel de `Documentacion/apoyo/` está excluido. La revisión estática de archivos de texto identificó plantillas y código de configuración. El alcance de esa revisión se limita a esta copia y excluye el historial Git.

## Historias de S00

El Excel local registra nueve historias completadas en S00. Los cambios constan en Historial 0.2 a 0.4 del 2026-11-21. Se verificaron las fórmulas, el historial y los totales de 9 de 9 en S00 y 9 de 213 en el backlog.

| ID | Evidencia de la revisión | Pendiente |
| --- | --- | --- |
| EF-0001 | Inventario del scaffold, SQL de referencia y revisión de AppHameIG | Completado |
| EF-0002 | Tres proyectos, referencias verificadas y compilación correcta | Completado |
| EF-0003 | Backend, Frontend, Database y Documentacion comprobadas en la raíz | Completado |
| EF-0004 | Controladores y carpetas por módulo según el árbol actual | Completado |
| EF-0005 | Contrato y rutas comprobadas en el diagnóstico MySQL | Completado |
| EF-0006 | Registro de decisiones y riesgos en el Excel y acuerdos vigentes en la memoria | Completado |
| EF-0007 | Libro local con 213 historias, 18 sprints y campos de seguimiento comprobados | Completado |
| EF-0008 | Tres repositorios publicados con `main` y `develop`, commits de un archivo y reglas de entrega documentadas | Completado |
| EF-0009 | Hoja `DefinicionHecho` y plantilla de entrega por historia | Completado |

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

### Plantilla de entrega por historia

- **Historia y alcance:** ID, sprint, criterio verificable, dependencias y decisión aplicable.
- **Implementación:** rutas y métodos comprobados por capa, contrato y archivo SQL si aplica.
- **Verificación:** comando, resultado, ambiente, evidencia y casos de seguridad o concurrencia según el riesgo.
- **Manual de uso del módulo:** propósito, roles, pasos, resultado esperado y errores recuperables. Incluir capturas reales cuando exista una interfaz.
- **Cierre:** comprobar la hoja `DefinicionHecho`, enlazar evidencias en el Excel, registrar pendientes y actualizar la memoria.

| Comprobación | Resultado |
| --- | --- |
| `dotnet sln Backend/EF.Solutions.slnx list` | Tres proyectos. |
| `dotnet build Backend/EF.Solutions.slnx --nologo` | Restauración y compilación correctas con SDK 10.0.302, cero errores y cero advertencias. |
| `dotnet test Backend/EF.Solutions.slnx --no-build --nologo` | La solución carece de proyectos de prueba y no reportó casos ejecutados. |
| Comprobaciones HTTP en loopback | `/health` y `/api/v1/plataforma/estado` devolvieron 200. `/health/database` devolvió 503 con el puerto local de prueba inaccesible. |

El diagnóstico autenticado contra MySQL 8.4 y el arranque de las tres apps React se verificaron en ciclos locales. La evidencia está en la [memoria del proyecto](../Memoria/ESTADO_ACTUAL.md).

## Inventario de AppHameIG

La copia está en `Documentacion/apoyo/AppHameIG - copia/` y está excluida de Git. Se revisaron rutas y código en modo lectura.

| Componente | Evidencia y posible adaptación |
| --- | --- |
| Solución | `HameConnected.slnx` reúne Web, ApplicationCore, Domain e Infrastructure en .NET 10. Los DTO y contratos aplicables se revisarían para Business. La persistencia se adaptaría a Data. |
| Importación del tablero | `TableroImportacionApiController::Validar/Confirmar` → `TableroImportacionService::ValidarAsync/ConfirmarAsync` → `hame.Usp_Tablero_Elementos_ImportarMasivo`. La separación entre validar y confirmar es candidata a adaptación en S09. El procedimiento requiere rediseño para MySQL y verificación de aislamiento e idempotencia. |
| Elementos y cliente | `TableroElementoService::PermisosAsync/GuardarAsync` expone permisos y escritura transaccional. `Tablero.cshtml` y `tablero-importacion.js` sirven de referencia funcional para React. |
| SQL | En la copia actual se localizó `database/sql scrip/` con 122 archivos SQL, 120 con sintaxis T-SQL reconocible. Incluye evaluación operativa, seguridad por compañía, historial y carga masiva, además de scripts de actualización y eliminación. Se conserva como referencia para los módulos correspondientes. Su adaptación requiere revisar cada operación, aplicar el dialecto del motor y validar las reglas de tenant. |

Ver [acta de cierre de S00](Actas/S00_Cierre.md).
