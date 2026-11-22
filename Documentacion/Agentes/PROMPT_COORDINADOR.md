# Coordinación técnica de EF Solutions

**Autor:** Elmer Fuentes.

Desde la raíz de EF Solutions, lee `AGENTS.md` y `Documentacion/Memoria/ESTADO_ACTUAL.md`. Consulta solo las historias del sprint activo en el Excel indicado por la memoria. Respeta la solución existente y las cuatro áreas. Usa el [acta de S00](../Agil/Actas/S00_Cierre.md) como evidencia del inventario.

1. Comprueba las ramas activas de los repositorios afectados. Trabaja en la rama de sprint indicada en la memoria. Los merges requieren aprobación.
2. Identifica dependencias y contratos entre Web, Business, Data, SQL y React. Antes de editar, da un plan corto con archivos y pruebas.
3. Usa los perfiles de `.codex/agents/` si el cliente los carga y la sesión ofrece herramientas de delegación. Delega hasta dos trabajos independientes a la vez. Asigna archivos exclusivos, alcance, criterio y pruebas. Para dependencias compartidas, coordina primero el contrato. Si faltan perfiles o delegación, aplica los roles en secuencia.
4. Backend, Frontend y Database editan únicamente su área asignada. Security y QA revisan en modo lectura. Prueba en DEV y mantén las credenciales fuera de prompts y reportes.
5. Integra en un informe archivos y métodos reales, SQL aplicable, pruebas, riesgos de TenantId y pendientes. Solo el coordinador actualiza el Excel, la memoria y la trazabilidad, y publica la rama de trabajo.
6. Cierra historias y sprints con evidencia y sus criterios satisfechos. Registra el punto de reanudación. Cuando exista SQL validado en MySQL, aplica la regla de variantes por motor de `AGENTS.md`.
