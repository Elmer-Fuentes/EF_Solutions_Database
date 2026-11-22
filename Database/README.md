# Database — scripts SQL independientes y versionados

**Autor:** Elmer Fuentes.

MySQL 8.4 es el motor inicial. Los scripts preliminares estan en `MySql/00_Referencia_Fase01/` y **no estan certificados como instalacion completa**.

Para cada proveedor, documentar esquemas, tablas, vistas, indices, funciones, procedimientos, migraciones, validaciones, reversiones y orden de instalacion. Cada archivo con correlativo, nombre del objeto, autor, fecha, version, dependencias y breve descripcion al estilo HAME.

Cada objeto se versiona en su archivo numerado con su definición completa mediante `CREATE`. Al actualizarlo, se reemplaza la definición dentro del mismo archivo y se registra la versión. Git conserva el historial. La aplicación de cambios sobre una base existente se documenta como recreación versionada con respaldo, transferencia y validación de datos cuando corresponda. Ejecutar la eliminación de un objeto solo con autorización explícita.

Al cerrar un sprint con scripts validados en MySQL, crear sus equivalentes aplicables en `SqlServer/`, `PostgreSql/` y `Oracle/`, organizados por módulo y tipo. Usar el dialecto de cada motor y versionar cada archivo en `EF_Solutions_Database` con el mismo ID de historia. Registrar el orden, la validación y su resultado por motor. La compatibilidad de cada proveedor requiere adaptador y pruebas en una instancia real.
