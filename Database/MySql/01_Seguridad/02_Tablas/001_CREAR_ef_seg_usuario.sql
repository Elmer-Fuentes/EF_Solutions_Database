/*
Nombre: 001_CREAR_ef_seg_usuario.sql | Módulo: 01_Seguridad
Autor: Elmer Fuentes | Versión: 1.0 | Fecha: 2026-11-21
Objetivo: Identidad global y hash del backend.
Historial: 1.0, definición inicial para S02.
Dependencias y orden: EF_DEV disponible. Ejecutar primero.
Validación: SHOW CREATE TABLE en EF_DEV y prueba de registro transaccional.
Reversión: conservar datos. Cualquier eliminación requiere respaldo y autorización explícita.
*/
CREATE TABLE IF NOT EXISTS `EF_DEV`.`ef_seg_usuario` (
    IdUsuario BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    Email VARCHAR(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL,
    PasswordHash VARCHAR(512) NOT NULL,
    Nombre VARCHAR(160) NOT NULL,
    Estado ENUM('ACTIVO', 'BLOQUEADO') NOT NULL DEFAULT 'ACTIVO',
    FechaCreacionUtc DATETIME(6) NOT NULL,
    PRIMARY KEY (IdUsuario),
    UNIQUE KEY UQ_ef_seg_usuario_email (Email)
) ENGINE=InnoDB;
