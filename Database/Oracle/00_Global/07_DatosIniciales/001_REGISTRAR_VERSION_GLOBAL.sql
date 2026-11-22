/*
Nombre: 001_REGISTRAR_VERSION_GLOBAL.sql | Módulo: 00_Global | Motor: Oracle
Autor: Elmer Fuentes | Versión: 1.0 | Fecha: 2026-11-21
Objetivo: Registrar la versión inicial sin reemplazar su fecha.
Historial: 1.0, equivalente inicial de EF-0019.
Dependencias y orden: Tabla de versiones creada. Ejecutar segundo.
Validación: ejecutar 001_VALIDAR_VERSION_GLOBAL.sql y comprobar una fila.
Reversión: conservar el historial de versiones.
*/
BEGIN
    INSERT INTO ef_cfg_VersionEsquema (Modulo, Version, AplicadaUtc)
    VALUES ('00_Global', '1.0', SYS_EXTRACT_UTC(SYSTIMESTAMP));
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN NULL;
END;
/
