# Contexto de EF Solutions

**Autor:** Elmer Fuentes.

EF Solutions es una plataforma SaaS modular, multi-tenant y multiproducto. EF Personal es el primer producto. Los demás dominios y su orden están en el backlog maestro.

| Área | Ubicación y responsabilidad |
| --- | --- |
| Backend | `Backend/EF.Solutions.slnx`, con Web para HTTP y composición, Business para contratos y reglas, y Data para persistencia. |
| Frontend | `Frontend/`, con las apps `ef-solutions-admin`, `ef-personal` y `ef-public-web`. |
| SQL | `Database/<Motor>/<Módulo>/<Tipo>/`. MySQL 8.4 es el proveedor inicial. |
| Documentación | `Documentacion/` contiene el plan, la trazabilidad y la memoria. |

**Para retomar desde otra conversación o cuenta:** abrir el mismo workspace, leer `AGENTS.md` y [ESTADO_ACTUAL.md](ESTADO_ACTUAL.md), y comprobar la rama activa en cada repositorio afectado. Usar [DECISIONES.md](DECISIONES.md) y [PENDIENTES.md](PENDIENTES.md) según la tarea. Consultar solo las historias del sprint activo en el Excel. La autorización continua se conserva en `AGENTS.md`.

**Backlog disponible:** `Documentacion/apoyo/EF_Solutions_Backlog_Maestro.xlsx`, excluido de Git. Si se usa otro equipo o checkout, conservar o transferir esa copia por un canal privado autorizado. La memoria es el resumen de reanudación y el Excel conserva el alcance por historia.
