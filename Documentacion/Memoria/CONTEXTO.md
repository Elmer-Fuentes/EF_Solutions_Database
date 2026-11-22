# Contexto de EF Solutions

**Autor:** Elmer Fuentes.

EF Solutions es una plataforma SaaS modular, multi-tenant y multiproducto. EF Personal es el primer producto. Los demás dominios y su orden están en el backlog maestro.

| Área | Ubicación y responsabilidad |
| --- | --- |
| Backend | `Backend/EF.Solutions.slnx`, con Web para HTTP y composición, Business para contratos y reglas, y Data para persistencia. |
| Frontend | `Frontend/`, con las apps `ef-solutions-admin`, `ef-personal` y `ef-public-web`. |
| SQL | `Database/<Motor>/<Módulo>/<Tipo>/`. MySQL 8.4 es el proveedor inicial. |
| Documentación | `Documentacion/` contiene el plan, la trazabilidad y la memoria. |

**Para retomar en otra conversación:** abrir el workspace y leer [ESTADO_ACTUAL.md](ESTADO_ACTUAL.md). Usar [DECISIONES.md](DECISIONES.md) para las reglas aplicables y [PENDIENTES.md](PENDIENTES.md) para elegir el siguiente trabajo. Abrir el Excel solo para consultar o actualizar las historias implicadas.

**Backlog disponible:** `Documentacion/apoyo/EF_Solutions_Backlog_Maestro.xlsx`, excluido de Git. Si se usa otro equipo o checkout, conservar o transferir esa copia por un canal privado autorizado. La memoria es el resumen de reanudación y el Excel conserva el alcance por historia.
