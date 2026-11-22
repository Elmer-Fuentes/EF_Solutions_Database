/*
Nombre: 001_CREAR_ef_cfg_VersionEsquema.sql | Módulo: 00_Global
Autor: Elmer Fuentes | Versión: 1.0 | Fecha: 2026-11-21
Objetivo: registrar las versiones aplicadas de los módulos.
Historial: 1.0, definición inicial.
Dependencias: 001_CREAR_EF_DEV.sql. Ejecutar antes del registro de versión.
Validación: 001_VALIDAR_EF_DEV.sql.
Reversión: conservar el historial de instalaciones.
*/
CREATE TABLE IF NOT EXISTS `EF_DEV`.`ef_cfg_VersionEsquema` (
    Modulo VARCHAR(64) NOT NULL,
    Version VARCHAR(32) NOT NULL,
    AplicadaUtc DATETIME(6) NOT NULL,
    PRIMARY KEY (Modulo, Version)
);
