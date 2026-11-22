/*
Nombre: 001_CREAR_ef_cfg_VersionEsquema.sql | Módulo: 00_Global | Motor: SqlServer
Autor: Elmer Fuentes | Versión: 1.0 | Fecha: 2026-11-21
Objetivo: Crear el registro de versiones del módulo.
Historial: 1.0, equivalente inicial de EF-0019.
Dependencias y orden: Base DEV administrada. Ejecutar primero.
Validación: ejecutar 001_VALIDAR_VERSION_GLOBAL.sql y comprobar una fila.
Reversión: conservar el historial de versiones.
*/
IF OBJECT_ID(N'dbo.ef_cfg_VersionEsquema', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.ef_cfg_VersionEsquema (
        Modulo VARCHAR(64) NOT NULL,
        Version VARCHAR(32) NOT NULL,
        AplicadaUtc DATETIME2(6) NOT NULL,
        PRIMARY KEY (Modulo, Version)
    );
END;
