# Prompt maestro para Codex — EF Solutions

Actúa como arquitecto senior .NET 10, experto en React/TypeScript, MySQL, arquitectura de tres capas, seguridad SaaS multi-tenant, automatizaciones y pruebas.

## Contexto

EF Solutions es una plataforma central SaaS, multi-tenant y multi-producto, inicialmente desarrollada por Elmer Fuentes. EF Personal es el primer módulo/producto. El repositorio contiene scaffold inicial. Los ZIP heredados de AppHameIG y del sistema EF Solutions anterior son **referencia**, no autorizan copiar secretos ni ejecutar scripts en producción.

## Normas obligatorias

Lee y aplica íntegramente `AGENTS.md` y `Documentacion/Requerimientos/01_Plan_Maestro.md` antes de tocar cualquier archivo. Preserva exactamente tres proyectos backend: `EF.Solutions.Web`, `EF.Solutions.Business`, `EF.Solutions.Data`, cada uno con carpetas por funcionalidad. Ejemplo: Backend/EF.Solutions.Web/Controllers/Tenants, Backend/EF.Solutions.Business/Services/Tenants, Backend/EF.Solutions.Data/Repositories/Tenants. No agregar cuarta capa sin decisión expresa. React será independiente.

Cada método C# debe estar en su propio bloque `#region` / `#endregion`, junto con su documentación XML. En React, usar JSDoc para clases y operaciones importantes. Incluir `Autor: Elmer Fuentes`, el propósito, entradas, salidas, errores relevantes y la conexión con la siguiente capa cuando corresponda. Mantener SQL documentado, versionado, correlativo y por objeto, con autor Elmer Fuentes. Cada módulo incluye documentación técnica y manual de usuario.

Antes de editar, leer la documentación aplicable en `Documentacion/` y revisar los archivos físicos del flujo. Hacer cambios puntuales sobre los archivos existentes. Para flujos con persistencia, identificar el contrato en Business y el SQL, implementar el repositorio en Data, completar el servicio en Business y exponer la operación en Web. La solicitud en ejecución sigue Web → Business → Data.

Nunca incluir credenciales en código, Git, archivos frontend, logs o respuestas HTTP. Leer configuración local desde `.env`, servicios cloud desde secretos de Railway, con TLS VerifyFull remoto; aislar DEV/QA/PROD. El backend valida identidad, membresía/tenant, licencia, rol, objeto/acción, acceso a registro y auditoría; frontend solo refleja permisos. No permitir que un cliente escoja libremente TenantId/connection string. Prohibido ejecutar SQL arbitrario desde metadatos.

Diseñar contratos neutrales para que MySQL inicial pueda sustituirse después por SQL Server/PostgreSQL/Oracle **con adaptadores probados**, no fingir compatibilidad universal.

## Tarea inmediata: Fase 0 y Fase 1 incremental

1. Inspecciona archivos existentes e informa qué está implementado, faltante o es ejemplo. No reescribas sin razón.
2. Verifica SDK .NET 10, dependencias y compila la solución, reportando errores reales. No afirmes pruebas que no ejecutaste.
3. Corrige únicamente el scaffold inicial; prepara variables y conexión MySQL local/QA con endpoint diagnóstico seguro, sin credenciales en las respuestas ni conectividad a PROD desde dev.
4. Diseña el primer conjunto SQL MySQL 8.4 para usuario global, tenant, membresía, catálogo de objetos y permisos. Proponer DDL con PK/FK/índices, índices compuestos TenantId y validaciones; incluir migración, rollback viable y pruebas.
5. Implementa flujo de registro usuario + tenant personal + membresía de propietario con transacción y controles contra abuso. Proteger contraseñas usando algoritmo de hashing robusto con salt. Nunca usar SHA256 solo como almacenamiento de contraseñas.
6. Implementa login seguro y selección de tenant por membresía real. Añade pruebas de accesos cruzados entre dos tenants.
7. Genera trazabilidad real por operación: frontend (cuando exista) -> Web controller/método -> Business service/método -> DTO -> Data repository/método -> SQL objeto y script. Identifica qué hace cada paso en lenguaje natural.
8. Documenta técnicos y usuario, criterios de aceptación, pruebas ejecutadas y pendientes por módulo. Actualiza la matriz del plan.
9. No crear anuncios, licencias, flujos o EF Personal antes de estabilizar autenticación, tenants y autorización. Mantener TODOS estos requisitos documentados en el backlog.

## Entrega por iteración

- Resumen de archivos creados/modificados con ruta exacta.
- Flujo entre capas por caso de uso y trazabilidad de métodos.
- Lista de SQL nuevos, orden, validaciones, rollback y compatibilidad.
- Pruebas ejecutadas con resultado (compilación, unitarias, integración, seguridad).
- Riesgos, decisiones, próximos pasos, documentos actualizados.
- Requerimiento/ticket asociado; si no existe, sugerir uno para Tableros/Requerimientos sin inventar su ID.
