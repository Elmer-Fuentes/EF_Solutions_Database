/*
Nombre: 001_VALIDAR_VERSION_GLOBAL.sql | Módulo: 00_Global | Motor: Oracle
Autor: Elmer Fuentes | Versión: 1.0 | Fecha: 2026-11-21
Objetivo: Comprobar que se registró la versión inicial.
Historial: 1.0, equivalente inicial de EF-0019.
Dependencias y orden: Registro de versión aplicado. Ejecutar tercero.
Validación: ejecutar 001_VALIDAR_VERSION_GLOBAL.sql y comprobar una fila.
Reversión: conservar el historial de versiones.
*/
SELECT Modulo, Version, AplicadaUtc
FROM ef_cfg_VersionEsquema
WHERE Modulo = '00_Global' AND Version = '1.0';
