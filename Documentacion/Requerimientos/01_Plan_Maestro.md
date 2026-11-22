# EF Solutions — Plan maestro vivo

**Versión:** 0.1 | **Autor:** Elmer Fuentes | **Estado:** Inicial | **Fecha:** 2026-11-21

## Decisiones aprobadas

- Marca: EF Solutions. Producto inicial: EF Personal; plataforma reutilizable, comercial.
- Tres proyectos de backend **Web**, **Business** y **Data**; una solución con carpetas por módulo/capacidad.
- Frontends React/TypeScript/Bootstrap Icons: Admin, EF Personal, web pública. Android mediante Capacitor.
- Motor inicial: MySQL 8.4, luego adaptadores certificados SQL Server/PostgreSQL/Oracle.
- Arquitectura centralizada multi-tenant; una identidad global y membresías múltiples por tenant.
- Entornos DEV/QA/PROD separados, credenciales separadas, .env local, producción por secretos protegidos.
- Datos críticos con columnas tipadas; metadatos dinámicos con JSON validado y relaciones tipadas; XML opcional donde aporte valor.
- Seguridad por acción/objeto y privacidad por registro; auditoría obligatoria.
- Scripts SQL por objeto, numerados y documentados, más migraciones, verificaciones y backups de datos.
- Trazabilidad Web -> Business -> Data -> SQL por operación, con métodos y rutas reales.

## Inventario de capacidades (cada fila debe transformarse en tickets)

| ID | Capacidad | Estado | Criterio de aceptación mínimo |
|---|---|---|---|
| EF-001 | Solución de tres capas | Iniciada | Proyectos independientes y dependencias sin ciclos |
| EF-002 | Configuración local/QA/PROD | Iniciada | Cambio de host sin editar C#, TLS en remoto |
| EF-003 | Identidad y autenticación | Pendiente | Registro/login seguro, recuperación, revocación |
| EF-004 | Registro de tenant desde login | Pendiente | Alta transaccional usuario+tenant+membresía owner |
| EF-005 | Membresías y tenant activo | Pendiente | Usuario en varios tenants, cambio validado |
| EF-006 | Catálogo de objetos protegibles | Pendiente | Módulos, menús, pantallas, componentes, campos, acciones |
| EF-007 | Roles, permisos y restricciones | Pendiente | Denegar por defecto, cambios auditados, API valida |
| EF-008 | Motor dinámico de entidades | Pendiente | Configurar entidad/campos/vistas/CRUD sin recompilar |
| EF-009 | Relaciones y formularios compuestos | Pendiente | Padre-hijo y múltiples CRUD en una pantalla |
| EF-010 | Organización y jerarquías | Pendiente | Plaza, puesto, empleado, supervisión sin ciclos |
| EF-011 | Workflow autorizaciones | Pendiente | Reglas secuenciales/paralelas, historial, delegación |
| EF-012 | Centro notificaciones | Pendiente | Bandeja por usuario/tenant, contador, leído y enlace seguro |
| EF-013 | Canales externos de alertas | Pendiente | Correo, Teams, reintentos, cola y registro fallos |
| EF-014 | Requerimientos globales | Pendiente | Origen usuario/tenant, sin fuga entre clientes |
| EF-015 | Tableros y seguimiento | Pendiente | Historial, tareas, responsables, archivos y cambios |
| EF-016 | Licencias y planes | Pendiente | Vigencia, cuotas, expiración segura, renovaciones verificadas |
| EF-017 | CRM, campañas y anuncios | Pendiente | Publicaciones para web pública configurables y vigentes |
| EF-018 | EF Personal finanzas | Pendiente | Cuentas, ingresos/gastos, deudas, ahorros, presupuestos |
| EF-019 | Personalización | Pendiente | Iconos Bootstrap, colores, atributos opcionales |
| EF-020 | API + React y Android | Pendiente | Una API común, experiencia móvil útil, sin secretos cliente |
| EF-021 | Base multi-proveedor | Pendiente | Adaptadores equivalentes probados por motor |
| EF-022 | Trazabilidad y documentación | Iniciada | Archivos/métodos reales, DOC técnico y manual usuario |
| EF-023 | Auditoría y backups | Pendiente | Restauración probada, retención y cifrado |
| EF-024 | Despliegue y Google Play | Pendiente | QA, producción, cumplimiento de políticas |

## Fases de aprobación

- **Fase 0**: arquitectura, inventario legado y modelo conceptual. Estado: EN PROGRESO.
- **Fase 1**: seguridad, tenants, permisos y scripts; después pruebas multi-tenant.
- **Fase 2**: entidades configurables con CRUD/relaciones y seguridad dinámica.
- **Fase 3**: organización, aprobaciones y notificaciones.
- **Fase 4**: requerimientos, tableros y comercial (planes, anuncios, licencias).
- **Fase 5**: EF Personal MVP, web pública, Android y beta.
- **Fase 6**: publicación, observabilidad, backups y otros proveedores SQL certificados.

## Riesgos abiertos

- Aislamiento entre tenants en MySQL sin RLS nativo; requiere defensa API + restricciones y pruebas adversariales.
- Precisión/serialización de importes financieros y consistencia de transferencias.
- Seguridad del motor dinámico frente a inyección, datos malformados y cambios de metadatos.
- Seguros de licencias/Google Play Billing, privacidad y cumplimiento de publicación.
- No usar datos HAME/empresas reales sin autorización, ni copiar credenciales/sesiones/tokens.

## Registro de cambios

| Fecha | Versión | Responsable | Cambio |
|---|---|---|---|
| 2026-11-21 | 0.1 | Elmer Fuentes | Arranque técnico, decisiones y backlog unificado |
