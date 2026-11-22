# Reglas de ingeniería de EF Solutions

**Autor canónico de documentación:** Elmer Fuentes.

## Arquitectura innegociable

**Git:** tres repositorios independientes: `EF_Solutions_Backend` para Backend, `EF_Solutions_Frontend` para Frontend y `EF_Solutions_Database` para Database y Documentacion. En el tercer repositorio, `Database/` y `Documentacion/` se mantienen como carpetas hermanas. Los cambios que abarcan varios repositorios comparten el ID `EF-####` y enlazan sus revisiones.

**Ramas:** publicar el trabajo de cada sprint en su rama `feature/*`, creada desde `develop` en cada repositorio afectado. Integrar en `develop` mediante pull request solo después de que el usuario apruebe el resultado. En cada repositorio afectado, promover a `main` el alcance aprobado y probado mediante un único pull request desde `release/*` por versión.

**Identidad y commits:** configurar `user.name` como `Elmer-Fuentes` y `user.email` como `delacruzelmer27@gmail.com` exclusivamente con `git config --local` en cada uno de los tres repositorios de EF Solutions antes del primer commit. Preservar la configuración global y las credenciales de DevOps. Crear un commit por archivo con el ID `EF-####` y una descripción breve y clara del cambio.

**Carpeta raíz:** `EF_Solutions/`. Las cuatro áreas principales son `Backend/`, `Frontend/`, `Database/` y `Documentacion/`. Los proyectos `.csproj` están en `Backend/`; SQL en `Database/`; documentación en `Documentacion/`; React y futuro Android/Capacitor en `Frontend/`; pruebas y configuraciones de backend en `Backend/`. El `.slnx` reside en `Backend/`. No crear otra carpeta `EF_Solutions` anidada.

1. EXACTAMENTE tres proyectos de backend: `EF.Solutions.Web`, `EF.Solutions.Business`, `EF.Solutions.Data`.
2. `Web` define endpoints y composición de dependencias; `Business` define contratos, DTO, validaciones y reglas; `Data` implementa repositorios e integraciones. Prohibido consultar BD desde controladores.
3. `Web` puede referenciar Business y Data para composición; Data referencia Business; Business NO referencia Web ni Data.
4. Carpetas agrupadas por negocio dentro de cada capa: `Controllers/Contratos`, `Services/Contratos`, `Repositories/Contratos`. No poner todos los archivos en una sola carpeta.
5. Cada módulo tiene especificación, trazabilidad de extremo a extremo, pruebas y manual de uso.
6. En C#, envolver cada método y su documentación XML en un bloque `#region` / `#endregion` con un nombre descriptivo. Usar JSDoc en React para clases y operaciones importantes. Incluir `Autor: Elmer Fuentes`, propósito, entradas, salidas, errores relevantes y el archivo y método de la capa siguiente cuando corresponda.

## Seguridad

7. Denegación predeterminada; nunca confiar en TenantId proporcionado sin validar membresía, contexto e identidad en servidor.
8. Control por módulo, menú, pantalla, acción, componente, campo y registro cuando sea necesario. Ocultar elementos React NO sustituye autorización API.
9. Contraseñas: hashing robusto + salt; datos recuperables: cifrado autenticado con gestión de claves; secretos: NO código, repositorio, logs ni JSON frontend.
10. Prohibido ejecutar SQL dinámico proporcionado por el usuario; metadatos JSON con tipos autorizados, migraciones versionadas, validaciones de esquema.
11. Mismo usuario puede pertenecer a distintos tenants. La administración global y el alcance tenant deben ser explícitos, auditados y no mezclarse.
12. QA/DEV/PROD con servidores, identidades, credenciales y backups separados. Nunca aplicar cambios automáticos a PROD desde desarrollo.
13. `.env` permitido SOLO en desarrollo y nunca commit. En producción, variables protegidas de Railway o gestor de secretos. No enviar host, puertos internos, credenciales o errores SQL al cliente.

## SQL y compatibilidad

14. MySQL 8.4 primero; diseñar contratos de repositorio neutrales para futuro SQL Server, PostgreSQL y Oracle; NO afirmar compatibilidad hasta tener adaptadores y pruebas reales.
15. Cada tabla, vista, índice, función, procedimiento, trigger autorizado y migración debe tener archivo numerado, nombre, módulo, breve descripción, autor Elmer Fuentes, versión, historial, dependencias, orden, validación y reversión cuando sea viable.
16. Scripts para reconstruir objetos NO reemplazan respaldos de registros ni de claves de cifrado.

## Alcance funcional que no se puede olvidar

17. Alta de usuario con tenant propio desde registro; invitaciones/membresías; cambio de tenant; permisos centrales y menús dinámicos.
18. EF Personal: cuentas, movimientos, deudas, ahorros, presupuestos, recordatorios; React + Bootstrap + Bootstrap Icons + Capacitor.
19. EF Meta Engine: entidades, campos tipados, relaciones padre-hijo, JSON, validaciones, formularios, CRUD y vistas configurables.
20. Organización: empleados, plazas, puestos, niveles jerárquicos, supervisiones y vigencias.
21. Workflow: estados, condiciones, aprobaciones secuenciales/paralelas, delegaciones, escalamiento y auditoría.
22. Notificaciones: bandeja por usuario/tenant al iniciar sesión, SignalR posterior, correo, Teams, push; colas, reintentos, deduplicación.
23. Requerimientos/Tableros: capturar solicitante, tenant origen, clasificación, seguimiento, historial, responsables y trazabilidad a Git/SQL.
24. Comercial: clientes, planes, licencias con vigencias, renovaciones por pago verificado, marketing, publicaciones/banners administrables hacia web pública, consentimientos.
25. Google Play: privacidad, eliminación de cuenta, facturación según reglas aplicables, pruebas reales y transparencia financiera.

## Ejecución controlada

26. Por cada tarea: inventario de archivos afectados -> plan -> desarrollo -> pruebas -> trazabilidad -> actualización docs -> reporte de pendientes.
27. Evitar cambios no solicitados en módulos, tablas, roles o menús existentes. Reutilizar AppHameIG/legado solo tras revisión.
28. No declarar trabajo listo si no se compila y pasa pruebas. Señalar riesgos y bloqueos concretos.
29. Iniciar cada tarea en `Documentacion/Memoria/ESTADO_ACTUAL.md` y consultar la sección **Memoria persistente** de estas reglas.
30. Editar los archivos existentes de forma puntual y seguir las convenciones del módulo. Crear archivos físicos solo cuando la funcionalidad lo requiera. Evitar la regeneración de archivos completos para cambios puntuales.
31. Implementar los flujos con persistencia desde Data hacia Business y luego Web. Identificar primero el contrato de repositorio en Business y el SQL existente o necesario. Después implementar el repositorio en Data, las reglas y validaciones en Business y, por último, el controlador o endpoint en Web. En ejecución, Web llama a Business y Business utiliza el contrato que implementa Data.
32. Dentro de cada capa, agrupar archivos físicos por módulo y dar a cada servicio, repositorio o controlador un archivo con nombre y responsabilidad claros. Por ejemplo, `Services/PanelDinamico/AlertasOperativasService.cs` y `Services/PanelDinamico/ControlPagosService.cs` exponen operaciones distintas. Conectar las capas mediante sus contratos e inyección de dependencias. Evitar carpetas genéricas de IA o archivos centrales que concentren operaciones de módulos distintos.
33. Mantener un archivo SQL numerado por objeto con su definición completa mediante `CREATE`. Al cambiar el objeto, actualizar ese mismo archivo y registrar la versión y el historial, usando Git para conservar las definiciones anteriores. No usar `ALTER` para cambiar el DDL del objeto. Si la actualización debe aplicarse en una base existente, documentar un procedimiento versionado de recreación con respaldo, transferencia y validación de datos cuando corresponda. La edición del archivo no ejecuta un `DROP`. Ejecutar eliminaciones solo con autorización explícita para el ambiente y el objeto.
34. En S02, implementar la emisión y validación de tokens de acceso, la gestión de sesiones y la verificación en servidor de la membresía del tenant. Los endpoints protegidos deben rechazar tokens inválidos o vencidos, y las pruebas deben cubrir el aislamiento entre tenants.
35. Evaluar la concurrencia en cada operación que modifique datos. Proteger las ediciones contra pérdidas por escrituras simultáneas, usar transacciones cuando varias escrituras deban completarse juntas y hacer idempotentes las operaciones que puedan reintentarse con efectos duplicados. Incluir pruebas concurrentes y de reintento según el riesgo de la operación.
36. La autorización continua del usuario cubre cambios locales, arranque de servicios de desarrollo, pruebas y actualizaciones del backlog respaldadas por evidencia. Continuar entre ciclos dentro del alcance acordado, detener las instancias temporales al terminar las pruebas y actualizar la memoria. Respetar las aprobaciones del entorno y las dependencias del sprint.
37. Al cerrar un sprint con scripts SQL validados en MySQL, crear los equivalentes aplicables para SQL Server, PostgreSQL y Oracle en `Database/<Motor>/<Módulo>/<Tipo>/`. Versionar cada archivo en `EF_Solutions_Database` con el mismo ID de historia y un commit por archivo. Publicar mediante el flujo de ramas acordado. Registrar por motor el orden de aplicación y la evidencia de validación. La compatibilidad de cada variante requiere pruebas en el motor real.
38. Mantener los perfiles, prompts y configuraciones de asistentes como herramientas locales. Versionar el código, las pruebas y la documentación técnica del producto.

## Memoria persistente

1. Al comenzar, leer `Documentacion/Memoria/ESTADO_ACTUAL.md`. Consultar únicamente los documentos relacionados con el módulo solicitado y las entradas pertinentes de la memoria.
2. Si la documentación vigente cubre la tarea, limitar la inspección a las rutas relevantes. Ampliarla solo para verificar una dependencia o una discrepancia concreta.
3. Trabajar exclusivamente sobre el sprint, el módulo y los archivos necesarios.
4. Antes de modificar código, abrir los archivos físicos implicados e identificar las dependencias entre Web, Business y Data, y sus relaciones con SQL y Frontend cuando apliquen.
5. Al finalizar, actualizar `ESTADO_ACTUAL.md` con el avance, las rutas modificadas y las pruebas reales. Registrar las decisiones nuevas en `DECISIONES.md`, los siguientes pasos en `PENDIENTES.md` y los cambios estables de contexto en `CONTEXTO.md`. Mantener la memoria breve, verificable y sin credenciales.
6. Mantener el Excel maestro con evidencias reales por ID. Conservar las historias y el historial. Actualizar estados bajo la autorización continua del usuario cuando exista evidencia suficiente y verificar el libro después de guardarlo.
7. Reutilizar el contexto disponible para documentos extensos que sigan vigentes. Releer solo las secciones que cambiaron o que hagan falta.
8. Mostrar fragmentos y resúmenes de archivos y salidas de consola cuando sean suficientes.
9. Repetir explicaciones anteriores solo cuando sean necesarias para resolver la tarea.
10. Mantener las decisiones arquitectónicas aprobadas. Cualquier cambio requiere autorización y debe quedar registrado.
