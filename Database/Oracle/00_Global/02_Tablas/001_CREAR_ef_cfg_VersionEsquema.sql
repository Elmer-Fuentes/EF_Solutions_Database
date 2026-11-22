/*
Nombre: 001_CREAR_ef_cfg_VersionEsquema.sql | Módulo: 00_Global | Motor: Oracle
Autor: Elmer Fuentes | Versión: 1.0 | Fecha: 2026-11-21
Objetivo: Crear el registro de versiones del módulo.
Historial: 1.0, equivalente inicial de EF-0019.
Dependencias y orden: Base DEV administrada. Ejecutar primero.
Validación: ejecutar 001_VALIDAR_VERSION_GLOBAL.sql y comprobar una fila.
Reversión: conservar el historial de versiones.
*/
CREATE TABLE IF NOT EXISTS ef_cfg_VersionEsquema (
    Modulo VARCHAR2(64 CHAR) NOT NULL,
    Version VARCHAR2(32 CHAR) NOT NULL,
    AplicadaUtc TIMESTAMP(6) NOT NULL,
    PRIMARY KEY (Modulo, Version)
);
