/* *******************************************************************************************************
   EF Solutions | OBJETO: ef_fin_movimiento | TIPO: TABLE
   Módulo: EF Personal - Finanzas | Versión: 1.0 | Autor: Equipo EF Solutions
   Descripción: Libro de movimientos. Transferencias se modelarán con asiento doble en siguiente fase.
   Historial: 2026-11-21 | 1.0 | Creación inicial.
******************************************************************************************************* */
USE ef_solutions_dev;
CREATE TABLE IF NOT EXISTS ef_fin_movimiento (
    IdMovimiento BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    TenantId BIGINT UNSIGNED NOT NULL,
    IdCuenta BIGINT UNSIGNED NOT NULL,
    Tipo ENUM('INGRESO','GASTO') NOT NULL,
    Importe DECIMAL(19,4) NOT NULL,
    Concepto VARCHAR(240) NOT NULL,
    FechaMovimiento DATETIME(6) NOT NULL,
    IdempotencyKey CHAR(36) NOT NULL,
    CreadoPorUsuarioId BIGINT UNSIGNED NOT NULL,
    FechaCreacion DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    PRIMARY KEY (IdMovimiento),
    UNIQUE KEY UQ_fin_mov_tenant_id (TenantId, IdMovimiento),
    UNIQUE KEY UQ_fin_mov_idempotencia (TenantId, IdempotencyKey),
    KEY IX_fin_mov_tenant_fecha (TenantId, FechaMovimiento),
    KEY IX_fin_mov_tenant_cuenta (TenantId, IdCuenta),
    CONSTRAINT CK_fin_mov_importe CHECK (Importe > 0),
    CONSTRAINT FK_fin_mov_cuenta FOREIGN KEY (TenantId, IdCuenta) REFERENCES ef_fin_cuenta (TenantId, IdCuenta),
    CONSTRAINT FK_fin_mov_usuario FOREIGN KEY (CreadoPorUsuarioId) REFERENCES ef_seg_usuario (IdUsuario)
) ENGINE=InnoDB;
