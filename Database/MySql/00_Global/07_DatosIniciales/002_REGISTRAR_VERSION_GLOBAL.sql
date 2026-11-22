/*
Nombre: 002_REGISTRAR_VERSION_GLOBAL.sql | Módulo: 00_Global
Autor: Elmer Fuentes | Versión: 1.0 | Fecha: 2026-11-21
Objetivo: registrar la versión inicial al concluir el DDL.
Historial: 1.0, registro inicial.
Dependencias: esquema EF_DEV y tabla ef_cfg_VersionEsquema.
Validación: 001_VALIDAR_EF_DEV.sql.
Reversión: conservar la evidencia de ejecución.
*/
INSERT INTO `EF_DEV`.`ef_cfg_VersionEsquema` (Modulo, Version, AplicadaUtc)
VALUES ('00_Global', '1.0', UTC_TIMESTAMP(6))
ON DUPLICATE KEY UPDATE AplicadaUtc = `ef_cfg_VersionEsquema`.AplicadaUtc;
