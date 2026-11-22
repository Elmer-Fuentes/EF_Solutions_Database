/*
Nombre: 002_CREAR_ef_ten_membresia.sql | Módulo: 02_Tenants
Autor: Elmer Fuentes | Versión: 1.0 | Fecha: 2026-11-21
Objetivo: Relación única por tenant e identidad.
Historial: 1.0, definición inicial para S02.
Dependencias y orden: Tablas ef_seg_usuario y ef_ten_tenant. Ejecutar tercero.
Validación: SHOW CREATE TABLE en EF_DEV y prueba de registro transaccional.
Reversión: conservar datos. Cualquier eliminación requiere respaldo y autorización explícita.
*/
CREATE TABLE IF NOT EXISTS `EF_DEV`.`ef_ten_membresia` (
    TenantId BIGINT UNSIGNED NOT NULL,
    IdUsuario BIGINT UNSIGNED NOT NULL,
    RolBase ENUM('OWNER', 'ADMIN', 'MIEMBRO', 'LECTOR') NOT NULL,
    Estado ENUM('INVITADO', 'ACTIVO', 'REVOCADO') NOT NULL,
    FechaCreacionUtc DATETIME(6) NOT NULL,
    PRIMARY KEY (TenantId, IdUsuario),
    KEY IX_ef_ten_membresia_usuario (IdUsuario, Estado),
    CONSTRAINT FK_ef_ten_membresia_tenant FOREIGN KEY (TenantId)
        REFERENCES `EF_DEV`.`ef_ten_tenant` (TenantId),
    CONSTRAINT FK_ef_ten_membresia_usuario FOREIGN KEY (IdUsuario)
        REFERENCES `EF_DEV`.`ef_seg_usuario` (IdUsuario)
) ENGINE=InnoDB;
