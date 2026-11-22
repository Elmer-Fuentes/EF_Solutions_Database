# Decisiones aprobadas

**Autor:** Elmer Fuentes.

| Tema | Acuerdo |
| --- | --- |
| Git | Tres repositorios. Backend, Frontend y Database con Documentacion. Un commit por archivo con ID `EF-####`. El trabajo se publica en ramas `feature/*` y se integra en `develop` mediante PR tras aprobación del usuario. `main` recibe un PR por versión desde `release/*`. Identidad Git por repositorio. |
| Capas y archivos | Tres proyectos Web, Business y Data, con archivos físicos por módulo y responsabilidad. Cambios puntuales. Para persistencia, revisar contrato y SQL, implementar Data, completar Business y exponer Web. En ejecución, Web llama a Business y Business usa el contrato implementado en Data. Un bloque `#region` por método C# con documentación XML. |
| Configuración | DEV usa MySQL local y `.env` privado. Producción usa variables protegidas del servidor con TLS `VerifyFull`. QA mantiene credenciales y recursos propios. Swagger y el diagnóstico de MySQL se publican en Development. |
| SQL | Un archivo numerado con la definición completa en `CREATE` por objeto. La recreación en una base existente requiere autorización y manejo de respaldo y datos. Al cerrar un sprint con scripts validados en MySQL, crear equivalentes aplicables para SQL Server, PostgreSQL y Oracle. Publicarlos en `EF_Solutions_Database` por motor, módulo y tipo, con un commit por archivo y el mismo ID de historia. Registrar la validación de cada motor. |
| Seguridad y concurrencia | S02 cubre tokens, sesiones y membresía. En cada escritura evaluar concurrencia, transacción e idempotencia según el caso. |
| Memoria y backlog | Estado breve en Markdown y alcance por historia en Excel. Los estados se actualizan con evidencia bajo la autorización continua del usuario. Consultar los archivos pertinentes al módulo activo. |
| Ciclos locales | Autorización continua para cambios locales, arranque, pruebas y actualización del backlog. Detener las instancias temporales al terminar las pruebas, documentar y continuar dentro del alcance y dependencias del sprint. |
