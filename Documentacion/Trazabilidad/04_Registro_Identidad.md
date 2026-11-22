# Registro de identidad y espacio personal

**Autor:** Elmer Fuentes. **Historias:** EF-0020 y EF-0024.

- **Entrada:** `POST /api/v1/autenticacion/registro` con `nombre`, `correo` y `clave`. Desarrollo local.
- **Web:** `RegistroController.RegistrarAsync` limita solicitudes por IP y devuelve 201, 400 o 409. El tenant se genera en el servidor.
- **Business:** `RegistroService.RegistrarAsync` valida datos, normaliza el correo y guarda una representación PBKDF2 con sal aleatoria por identidad.
- **Data y SQL:** `RegistroMySqlRepositorio.CrearAsync` usa parámetros y una transacción para insertar `ef_seg_usuario`, `ef_ten_tenant` y `ef_ten_membresia`. La clave única protege el correo ante altas concurrentes. El aprovisionamiento de DEV otorga INSERT solo en esas tablas.
- **Pruebas:** los tres proyectos compilaron. Un correo inválido devolvió 400. Dos altas simultáneas del mismo correo con distinta capitalización devolvieron 201 y 409. MySQL confirmó una identidad con hash, un espacio y una membresía OWNER activa para el registro sintético.
- **Pendiente:** interfaz, sesión y validación de aislamiento sobre endpoints autenticados.
