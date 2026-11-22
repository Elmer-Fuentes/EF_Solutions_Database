/* *******************************************************************************************************
   EF Solutions | OBJETO: ef_seg_usuario | TIPO: TABLE
   Módulo: Seguridad | Versión: 1.0 | Autor: Equipo EF Solutions
   Descripción: Identidad global; el hash se calcula con Argon2id en el backend.
   Historial: 2026-11-21 | 1.0 | Creación inicial.
******************************************************************************************************* */
USE ef_solutions_dev;
CREATE TABLE IF NOT EXISTS ef_seg_usuario (
    IdUsuario BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    Email VARCHAR(254) NOT NULL,
    PasswordHash VARCHAR(512) NOT NULL,
    Nombre VARCHAR(160) NOT NULL,
    Estado ENUM('PENDIENTE','ACTIVO','BLOQUEADO') NOT NULL DEFAULT 'PENDIENTE',
    FechaCreacion DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    FechaActualizacion DATETIME(6) NULL,
    PRIMARY KEY (IdUsuario), UNIQUE KEY UQ_seg_usuario_email (Email)
) ENGINE=InnoDB;
