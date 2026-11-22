/*
Nombre: 001_CREAR_ef_ten_tenant.sql | Módulo: 02_Tenants
Autor: Elmer Fuentes | Versión: 1.0 | Fecha: 2026-11-21
Objetivo: Espacio personal de una identidad.
Historial: 1.0, definición inicial para S02.
Dependencias y orden: EF_DEV disponible. Ejecutar segundo.
Validación: SHOW CREATE TABLE en EF_DEV y prueba de registro transaccional.
Reversión: conservar datos. Cualquier eliminación requiere respaldo y autorización explícita.
*/
CREATE TABLE IF NOT EXISTS `EF_DEV`.`ef_ten_tenant` (
    TenantId BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(160) NOT NULL,
    Estado ENUM('ACTIVO', 'SUSPENDIDO') NOT NULL DEFAULT 'ACTIVO',
    FechaCreacionUtc DATETIME(6) NOT NULL,
    PRIMARY KEY (TenantId)
) ENGINE=InnoDB;
