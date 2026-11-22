/*
Nombre: 001_VALIDAR_EF_DEV.sql | Módulo: 00_Global
Autor: Elmer Fuentes | Versión: 1.0 | Fecha: 2026-11-21
Objetivo: verificar el esquema y su versión registrada.
Historial: 1.0, consulta inicial de verificación.
Dependencias: ejecutar después de registrar la versión.
Validación: debe retornar una fila, con módulo 00_Global, versión 1.0 y colación utf8mb4_0900_ai_ci.
Reversión: consulta de solo lectura.
*/
SELECT v.Modulo, v.Version, v.AplicadaUtc, s.DEFAULT_COLLATION_NAME
FROM `EF_DEV`.`ef_cfg_VersionEsquema` AS v
JOIN INFORMATION_SCHEMA.SCHEMATA AS s ON s.SCHEMA_NAME = 'EF_DEV'
WHERE v.Modulo = '00_Global' AND v.Version = '1.0';
