# EF Solutions — Espacio de trabajo

Este repositorio, `EF_Solutions_Database`, reúne los scripts en `Database/` y la documentación en `Documentacion/`.

**Autor:** Elmer Fuentes  
**Estructura aprobada:** cuatro áreas de trabajo distribuidas en tres repositorios Git.
**Estado:** scaffold inicial; no es aun una aplicacion comercial funcional.

## Estructura definitiva

```text
EF_Solutions/
├── Backend/             # SOLUCION .NET: 3 proyectos (Web, Business, Data)
│   ├── EF.Solutions.slnx
│   ├── EF.Solutions.Web/
│   ├── EF.Solutions.Business/
│   ├── EF.Solutions.Data/
│   ├── Tests/
│   └── Configuracion/
├── Frontend/            # Workspace React / TypeScript (aplicaciones por producto)
│   ├── package.json
│   ├── ef-solutions-admin/
│   ├── ef-personal/
│   │   └── android/     # Futuro proyecto Capacitor
│   └── ef-public-web/
├── Database/            # SQL organizado por proveedor
│   ├── MySql/
│   ├── PostgreSql/
│   ├── SqlServer/
│   └── Oracle/
├── Documentacion/       # Requerimientos, arquitectura, prompts y trazabilidad
├── AGENTS.md
├── .gitignore
└── README.md
```

No existe una solucion .NET en la raiz. Abrir `Backend/EF.Solutions.slnx` para trabajar con las **tres capas**, que son proyectos `.csproj` reales.

`Frontend` tiene un workspace npm independiente y proyectos preparados como estructura, **todavia sin una aplicacion React implementada**.

`Database/MySql/00_Referencia_Fase01/` conserva los primeros scripts, no aplicados ni verificados contra una instancia real. Los directorios de los demas proveedores son reservados, no equivalen a compatibilidad implementada.

## Comenzar en Visual Studio o VS Code

**Backend**

```powershell
cd C:\DEV\EF_Solutions\Backend
dotnet restore .\EF.Solutions.slnx
dotnet build .\EF.Solutions.slnx
cd .\EF.Solutions.Web
Copy-Item .env.example .env
# Ajustar valores de EF_DEV en .env
$env:ASPNETCORE_ENVIRONMENT='Development'
dotnet run
```

**QA remota:** configurar el host con `DOTNET_ENVIRONMENT=Staging` y las variables protegidas de QA. Ver [configuración de Backend](Backend/README.md).

**Frontend**: el workspace de apps se implementara en fases posteriores; no hay una interfaz funcional ni scripts de ejecucion aun.

**Seguridad**: archivos `.env` reales y secretos no se suben a Git. Produccion usa secretos protegidos y acceso MySQL con TLS validado. Si una cuenta del sistema es comprometida, el simple hecho de usar un archivo externo no garantiza privacidad de contraseñas.

## Git

| Repositorio propuesto | Contenido |
| --- | --- |
| `EF_Solutions_Backend` | Solución .NET, tres proyectos, pruebas y configuración de Backend. |
| `EF_Solutions_Frontend` | Workspace npm con las aplicaciones React y el futuro proyecto Android. |
| `EF_Solutions_Database` | Carpetas hermanas `Database/` y `Documentacion/` dentro del mismo checkout. |

Cada repositorio mantiene `main`, `develop` y ramas por cambio. Los commits y las revisiones relacionados usan el mismo ID `EF-####`. La revisión de cada entrega enlaza los cambios de API, frontend y SQL, con el orden de aplicación cuando corresponda. El repositorio de Database y Documentacion debe excluir `Documentacion/apoyo/` en su propio `.gitignore`.

Las ramas de trabajo se integran en `develop` mediante pull requests. Para publicar, cada repositorio afectado abre un solo pull request hacia `main` desde la rama `release/*` que contiene el alcance aprobado y probado de la versión. Si quedan historias pendientes en `develop`, la rama de entrega se prepara desde `main` con los cambios aprobados y sus dependencias.

## Documentacion

- `AGENTS.md`: reglas de ingeniería y flujo de trabajo.
- `Documentacion/Requerimientos/01_Plan_Maestro.md`: alcance acordado.
- `Documentacion/Trazabilidad/03_Trazabilidad_Ejemplo.md`: ejemplo de rutas y metodos.

**Validacion:** se verificaron rutas, XML y presencia de archivos; no se compilo .NET ni se ejecuto MySQL por no disponer de esas herramientas en este entorno.
