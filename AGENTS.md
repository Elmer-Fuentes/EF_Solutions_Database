# Reglas de ingeniería EF Solutions para Codex

**Autor canónico de documentación:** Elmer Fuentes.

## Arquitectura innegociable

**Git:** tres repositorios independientes: `EF_Solutions_Backend` para Backend, `EF_Solutions_Frontend` para Frontend y `EF_Solutions_Database` para Database y Documentacion. En el tercer repositorio, `Database/` y `Documentacion/` se mantienen como carpetas hermanas. Los cambios que abarcan varios repositorios comparten el ID `EF-####` y enlazan sus revisiones.

**Ramas:** integrar las ramas de trabajo en `develop` mediante pull requests. En cada repositorio afectado, promover a `main` el alcance aprobado y probado mediante un único pull request desde `release/*` por versión.

**Identidad y commits:** configurar `user.name` como `Elmer-Fuentes` y `user.email` como `delacruzelmer27@gmail.com` exclusivamente con `git config --local` en cada uno de los tres repositorios de EF Solutions antes del primer commit. Preservar la configuración global y las credenciales de DevOps. Crear un commit por archivo con el ID `EF-####` y una descripción breve y clara del cambio.

**Carpeta raíz:** `EF_Solutions/`. Las cuatro áreas principales son `Backend/`, `Frontend/`, `Database/` y `Documentacion/`. Los proyectos `.csproj` están en `Backend/`; SQL en `Database/`; documentación en `Documentacion/`; React y futuro Android/Capacitor en `Frontend/`; pruebas y configuraciones de backend en `Backend/`. El `.slnx` reside en `Backend/`. No crear otra carpeta `EF_Solutions` anidada.

1. EXACTAMENTE tres proyectos de backend: `EF.Solutions.Web`, `EF.Solutions.Business`, `EF.Solutions.Data`.
2. `Web` define endpoints y composición de dependencias; `Business` define contratos, DTO, validaciones y reglas; `Data` implementa repositorios e integraciones. Prohibido consultar BD desde controladores.
3. `Web` puede referenciar Business y Data para composición; Data referencia Business; Business NO referencia Web ni Data.
4. Carpetas agrupadas por negocio dentro de cada capa: `Controllers/Contratos`, `Services/Contratos`, `Repositories/Contratos`. No poner todos los archivos en una sola carpeta.
5. Cada módulo tiene especificación, trazabilidad de extremo a extremo, pruebas y manual de uso.
6. Documentación XML en C# y JSDoc en React para clases, métodos y operaciones importantes. Incluir `Autor: Elmer Fuentes`, descripción breve, entradas/salidas, errores relevantes y el archivo/método que conecta con la siguiente capa. Regiones C# cuando agrupen responsabilidades reales.

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
