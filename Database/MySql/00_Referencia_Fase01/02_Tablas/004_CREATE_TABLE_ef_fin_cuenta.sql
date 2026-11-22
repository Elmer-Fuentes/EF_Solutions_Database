/* *******************************************************************************************************
   EF Solutions | OBJETO: ef_fin_cuenta | TIPO: TABLE
   Módulo: EF Personal - Finanzas | Versión: 1.0 | Autor: Equipo EF Solutions
   Descripción: Cuentas monetarias propias de un tenant; atributos visuales configurables JSON.
   Historial: 2026-11-21 | 1.0 | Creación inicial.
******************************************************************************************************* */
USE ef_solutions_dev;
CREATE TABLE IF NOT EXISTS ef_fin_cuenta (
    IdCuenta BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    TenantId BIGINT UNSIGNED NOT NULL,
    Nombre VARCHAR(120) NOT NULL,
    Tipo ENUM('EFECTIVO','BANCO','BILLETERA','OTRO') NOT NULL DEFAULT 'EFECTIVO',
    Moneda CHAR(3) NOT NULL DEFAULT 'GTQ',
    SaldoInicial DECIMAL(19,4) NOT NULL DEFAULT 0,
    ConfiguracionJson JSON NULL,
    Estado ENUM('ACTIVA','ARCHIVADA') NOT NULL DEFAULT 'ACTIVA',
    FechaCreacion DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (IdCuenta),
    UNIQUE KEY UQ_fin_cuenta_tenant_id (TenantId, IdCuenta),
    KEY IX_fin_cuenta_tenant_estado (TenantId, Estado),
    CONSTRAINT FK_fin_cuenta_tenant FOREIGN KEY (TenantId) REFERENCES ef_ten_tenant (TenantId)
) ENGINE=InnoDB;
