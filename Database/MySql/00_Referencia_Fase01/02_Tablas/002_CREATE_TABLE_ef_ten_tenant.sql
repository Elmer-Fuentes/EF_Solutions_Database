/* *******************************************************************************************************
   EF Solutions | OBJETO: ef_ten_tenant | TIPO: TABLE
   Módulo: Tenants | Versión: 1.0 | Autor: Equipo EF Solutions
   Descripción: Espacio aislado de trabajo personal/familiar.
   Historial: 2026-11-21 | 1.0 | Creación inicial.
******************************************************************************************************* */
USE ef_solutions_dev;
CREATE TABLE IF NOT EXISTS ef_ten_tenant (
    TenantId BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(160) NOT NULL,
    Slug VARCHAR(100) NOT NULL,
    Tipo ENUM('PERSONAL','FAMILIAR','EQUIPO') NOT NULL DEFAULT 'PERSONAL',
    Estado ENUM('ACTIVO','SUSPENDIDO') NOT NULL DEFAULT 'ACTIVO',
    ConfiguracionJson JSON NULL,
    FechaCreacion DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (TenantId), UNIQUE KEY UQ_ten_tenant_slug (Slug)
) ENGINE=InnoDB;
