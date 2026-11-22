/* *******************************************************************************************************
   EF Solutions | OBJETO: ef_ten_membresia | TIPO: TABLE
   Módulo: Tenants | Versión: 1.0 | Autor: Equipo EF Solutions
   Descripción: Relaciona identidad global con tenants; la autorización la decide el backend.
   Historial: 2026-11-21 | 1.0 | Creación inicial.
******************************************************************************************************* */
USE ef_solutions_dev;
CREATE TABLE IF NOT EXISTS ef_ten_membresia (
    IdMembresia BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    TenantId BIGINT UNSIGNED NOT NULL,
    IdUsuario BIGINT UNSIGNED NOT NULL,
    RolBase ENUM('OWNER','ADMIN','MIEMBRO','LECTOR') NOT NULL DEFAULT 'MIEMBRO',
    Estado ENUM('INVITADO','ACTIVO','REVOCADO') NOT NULL DEFAULT 'INVITADO',
    FechaCreacion DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (IdMembresia),
    UNIQUE KEY UQ_ten_membresia_tenant_usuario (TenantId, IdUsuario),
    CONSTRAINT FK_ten_membresia_tenant FOREIGN KEY (TenantId) REFERENCES ef_ten_tenant (TenantId),
    CONSTRAINT FK_ten_membresia_usuario FOREIGN KEY (IdUsuario) REFERENCES ef_seg_usuario (IdUsuario)
) ENGINE=InnoDB;
