/*
Nombre: 001_OTORGAR_INSERCION_REGISTRO_DEV.sql | Módulo: 01_Seguridad
Autor: Elmer Fuentes | Versión: 1.0 | Fecha: 2026-11-21
Objetivo: habilitar el alta de usuario, tenant y membresía en DEV.
Historial: 1.0, permisos específicos para registro.
Dependencias: usuario ef_dev@127.0.0.1 y las tres tablas de registro ya creadas. Ejecutar después del DDL.
Validación: SHOW GRANTS FOR 'ef_dev'@'127.0.0.1' y prueba HTTP del registro.
Reversión: revocar los tres permisos INSERT si se deshabilita el registro.
*/
GRANT INSERT ON `EF_DEV`.`ef_seg_usuario` TO 'ef_dev'@'127.0.0.1';
GRANT INSERT ON `EF_DEV`.`ef_ten_tenant` TO 'ef_dev'@'127.0.0.1';
GRANT INSERT ON `EF_DEV`.`ef_ten_membresia` TO 'ef_dev'@'127.0.0.1';
