/*
Nombre: 001_CREAR_USUARIO_EF_DEV.sql | Prefijo: ef_cfg_ | Módulo: 00_Global
Autor: Elmer Fuentes | Versión: 1.0 | Fecha: 2026-11-21
Objetivo: aprovisionar la cuenta local de ejecución para diagnóstico y lectura de EF_DEV.
Historial: 1.0 creación inicial.
Dependencias y orden: ejecutar después de 001_CREAR_EF_DEV.sql como administrador en MySQL local.
La creación devuelve la contraseña generada una vez. Ejecutar en una consola privada sin registrar su salida.
Validación: SHOW GRANTS FOR 'ef_dev'@'127.0.0.1'; probar SELECT 1 en EF_DEV con la cuenta de aplicación.
Reversión: si esta ejecución creó la cuenta, su eliminación requiere verificar que no esté en uso.
*/
CREATE USER IF NOT EXISTS 'ef_dev'@'127.0.0.1' IDENTIFIED BY RANDOM PASSWORD;
GRANT SELECT ON `EF\_DEV`.* TO 'ef_dev'@'127.0.0.1';
