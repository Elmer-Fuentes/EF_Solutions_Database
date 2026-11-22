# Estado actual

**Autor:** Elmer Fuentes. **Revisión:** 2026-11-21.

**Punto de reanudación:** S00 completado con 9 de 9 historias. S01 tiene 5 de 10 completadas. El Excel registra 14 de 213 completadas e Historial 0.6.

| Área | Avance comprobado | Archivos de referencia |
| --- | --- | --- |
| Git | Los tres repositorios tienen `main` y `develop` publicados. Hay cambios posteriores aún locales en los tres checkouts. | [Inventario S00](../Agil/S00_Inventario_y_Gobierno.md) |
| Backend | Compilaron los tres proyectos .NET 10 con cero errores y advertencias. Swagger enumeró tres rutas y devolvió 404 con el perfil Production de prueba. | `Backend/EF.Solutions.Web/Program.cs`, `EF.Solutions.Web.csproj`, `Backend/README.md` |
| MySQL DEV | MySQL Server 8.4.13, esquema `EF_DEV` y cuenta de lectura `ef_dev`. La prueba autenticada de `/health/database` devolvió HTTP 200. | `Database/MySql/00_Global/`, [trazabilidad del diagnóstico](../Trazabilidad/03_Trazabilidad_Ejemplo.md) |
| Frontend | TypeScript y los tres builds pasaron. Los servidores de Admin, Personal y Web Pública devolvieron HTTP 200 y entregaron sus módulos React. `npm audit` reportó cero vulnerabilidades conocidas en la instalación verificada. | `Frontend/package.json`, `package-lock.json`, `tsconfig.json`, los `index.html` y `src/main.tsx` de las apps, y `Frontend/README.md` |

**Arranque local:** Web usa `dotnet run --project .\EF.Solutions.Web\EF.Solutions.Web.csproj` desde `Backend/`. Swagger usa el puerto 5257. Desde `Frontend/`, `npm.cmd run dev` levanta Admin en 5173 y `npm.cmd run dev --workspace=ef-personal` o `--workspace=ef-public-web` levanta Personal en 5174 o Web Pública en 5175. Verificar los puertos antes de abrir otra instancia.

**Último cambio:** se añadieron `Backend/.github/workflows/ci.yml` y `Frontend/.github/workflows/ci.yml` para EF-0018. Se verificaron localmente el build Release .NET y los tres builds TypeScript/Vite. `dotnet test` terminó sin casos. Se registraron ambas evidencias en el Excel conservando sus estados y fórmulas.

**Último ciclo local:** se recompilaron Backend y las tres apps, y `npm audit` reportó cero vulnerabilidades conocidas. Swagger enumeró las tres rutas de Web, que devolvieron HTTP 200, incluido el diagnóstico autenticado de MySQL DEV. Los tres servidores Vite devolvieron HTTP 200 y sirvieron sus módulos React. `dotnet test` no reportó casos porque la solución aún carece de proyectos de prueba. Se detuvieron las instancias del ciclo y quedaron libres los puertos 50974 y 5173–5175.

**Rama de trabajo S01:** `feature/s01-fundacion-local` en Backend, Frontend y Database con Documentacion. Integración mediante PR tras aprobación del resultado.

**Último avance S01:** cerradas EF-0010, EF-0011, EF-0013 y EF-0017 con evidencia de compilación, navegación y clic en Chrome, exclusión del archivo privado y diagnóstico MySQL. Los dos flujos CI ahora se disparan en `feature/**`. La consulta de ejecución remota sigue pendiente. Ver [trazabilidad](../Trazabilidad/03_Trazabilidad_Ejemplo.md) y [pendientes](PENDIENTES.md).

**Perfiles S01 (EF-0012 a EF-0016):** Backend compila con cero errores y advertencias. Development cargó el archivo privado y el diagnóstico MySQL devolvió 200. Staging y Production arrancaron con variables de prueba y una ruta privada inválida. Swagger y diagnóstico devolvieron 404 en ambos. Staging rechazó TLS Preferred. La configuración de Docker Compose pasó la validación estática. Quedan pendientes el arranque del contenedor y la conexión autenticada con TLS remoto.

**EF-0019:** el lanzador interactivo `Database/MySql/00_Global/11_InstalacionCompleta/001_INSTALAR_EF_DEV.ps1` solicitó la contraseña de forma enmascarada, terminó con código 0 y confirmó la versión 1.0 y la colación esperada en MySQL DEV. Se añadieron los equivalentes del registro en SQL Server, PostgreSQL y Oracle. Su ejecución en instancias reales está pendiente.

**EF-0018:** GitHub Actions completó los flujos base de Backend (44979105793) y Frontend (44979109129). Se añadieron y probaron localmente `Backend/Tests/IntegrationTests/VerificarApiDev.ps1` (contrato de plataforma, Swagger y HTTP 503 ante MySQL inaccesible) y `Frontend/ef-solutions-admin/tests/estadoPlataforma.test.mjs` (tres casos aprobados). Ambos flujos ya invocan estas pruebas en la rama de S01. Queda pendiente lint y verificar la ejecución remota de las nuevas pruebas.
