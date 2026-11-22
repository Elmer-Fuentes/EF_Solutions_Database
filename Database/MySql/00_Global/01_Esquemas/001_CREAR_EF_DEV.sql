/*
Nombre: 001_CREAR_EF_DEV.sql | Prefijo: ef_cfg_ | Módulo: 00_Global
Autor: Elmer Fuentes | Versión: 1.0 | Fecha: 2026-11-21
Objetivo: crear el esquema EF_DEV para desarrollo local.
Historial: 1.0 creación inicial.
Dependencias y orden: MySQL 8.4 local, cuenta administrativa autorizada. Ejecutar primero.
Validación: SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'EF_DEV';
Reversión: conservar el esquema. Cualquier eliminación requiere revisar los datos y contar con respaldo.
*/
CREATE DATABASE IF NOT EXISTS `EF_DEV`
    CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
