# Autor: Elmer Fuentes
# Versión 1.0 (2026-11-21). Ejecuta los objetos de 00_Global en orden sobre MySQL DEV.
# Requiere MySQL 8.4 local y una cuenta administrativa. Solicita la contraseña al iniciar.
[CmdletBinding()]
param(
    [string]$Cliente = 'mysql.exe',
    [ValidateRange(1, 65535)][int]$Puerto = 3306,
    [string]$Usuario = 'root'
)

$ErrorActionPreference = 'Stop'
$modulo = Split-Path -Parent $PSScriptRoot
$archivos = @(
    '01_Esquemas/001_CREAR_EF_DEV.sql'
    '02_Tablas/001_CREAR_ef_cfg_VersionEsquema.sql'
    '07_DatosIniciales/002_REGISTRAR_VERSION_GLOBAL.sql'
    '09_Validaciones/001_VALIDAR_EF_DEV.sql'
)
$sql = ($archivos | ForEach-Object {
    Get-Content -Encoding UTF8 -Raw -LiteralPath (Join-Path $modulo $_)
}) -join "`n"
$version = $sql | & $Cliente --no-defaults --protocol=TCP --host=127.0.0.1 "--port=$Puerto" "--user=$Usuario" --password --batch --skip-column-names --default-character-set=utf8mb4
if ($LASTEXITCODE -ne 0 -or @($version).Count -ne 1 -or $version -notmatch '^00_Global\s+1\.0\s+.+\s+utf8mb4_0900_ai_ci$') {
    throw 'La instalación de EF_DEV no superó la validación.'
}
$version
