/* *******************************************************************************************************
   EF Solutions | OBJETO: VALIDAR_TABLAS_BASE | TIPO: VALIDACION
   Módulo: Plataforma | Versión: 1.0 | Autor: Equipo EF Solutions
   Descripción: Verifica tablas existentes y restricciones declaradas en fase inicial.
   Historial: 2026-11-21 | 1.0 | Creación inicial.
******************************************************************************************************* */
USE ef_solutions_dev;
SELECT TABLE_NAME, ENGINE FROM information_schema.TABLES
 WHERE TABLE_SCHEMA = 'ef_solutions_dev' AND TABLE_NAME LIKE 'ef\_%' ESCAPE '\'
 ORDER BY TABLE_NAME;
SELECT TABLE_NAME, CONSTRAINT_NAME, CONSTRAINT_TYPE
 FROM information_schema.TABLE_CONSTRAINTS
 WHERE CONSTRAINT_SCHEMA='ef_solutions_dev' ORDER BY TABLE_NAME, CONSTRAINT_NAME;
