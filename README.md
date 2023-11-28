# Como implementar taskpro

**Paso 1: Clonar el repositorio**
- Clonar el repositorio con el comando `git clone`.

**Paso 2: Instalar composer**
- Dentro del proyecto en la consola, ejecuta:

```bash
composer install
```

**Paso 3: Crear una base de datos**
- Crea una base de datos y asígnale un nombre, por ejemplo, "taskpro".

**Paso 4: Crear el archivo .env**
- En la raíz del proyecto, ejecuta el siguiente comando: 

```bash
cp .env.example .env
```

- Configura el archivo `.env` y proporciona el nombre de la base de datos que creaste.

**Paso 5: Generar la clave de aplicación**
- Ejecuta en la consola: 

```bash
php artisan key:generate
```

**Paso 6: Ejecutar las migraciones**
- Para crear las tablas en la base de datos, ejecuta: 

```bash
php artisan migrate
```

**Paso 6: Ejecutar los seed**
- Si deseas generar datos de ejemplo, ejecuta: 

```bash 
php artisan db:seed
```

**Paso 7: Ejecutar las pruebas**
- Para ejecutar las pruebas, usa: 

```bash 
php artisan test
```

**Paso 8: Iniciar el servidor**
- Inicia el servidor ejecutando: 

```bash
php artisan serve
```

**Uso del API con Passport**

Es esencial que todas las solicitudes incluyan los encabezados `Accept: application/json` y `Content-Type: application/json`.

**Pasos para configurar Passport Keys**

- Cada vez que se implemente el proyecto, es necesario generar las claves de Passport con el siguiente comando:

```bash
php  artisan  passport:keys
```
**Crear Password Grant Client**

- Para habilitar que los usuarios inicien sesión con su nombre de usuario y contraseña, sigue estos pasos para crear un Grant Client:

```bash
php artisan passport:client --password
```

- Este procedimiento debe llevarse a cabo en cada despliegue del proyecto. Asegúrate de tomar nota del `client_id` y `client_secret`, ya que estos deben incluirse en cada solicitud de inicio de sesión.

**Registro de Usuario**

- Envía una solicitud POST a `/api/v1/usuario/alta` con los siguientes campos:

```json
{
  "user": "Diego123",
  "email": "dvega@correo.com",
  "password": "Password123",
  "password_confirmation": "Password123",
  "nombre" : "Diego",
  "apellido" : "Vega",
  "fecha_nac" : "1996-03-22",
  "foto" : "https://example.com/images/diegovega.jpg"
}
```

Todos los campos son obligatorios.

**Inicio de Sesión**

- El proceso de inicio de sesión debe ir a la URL `oauth/token`, debe ser de tipo POST, y debe contener los siguientes campos:

```json
{
  "username": "dvega@correo.com",
  "password": "Password123",
  "grant_type": "password",
  "client_id": "CLIENT_ID",
  "client_secret": "CLIENT_SECRET"
}
```

Esto devuelve un JSON con el token de acceso.

**Validación del Token**

Para validar el token, envía una petición GET a `/api/v1/validate`, con el token obtenido en un encabezado llamado Authorization con el contenido Bearer `TOKEN_OBTENIDO`.

Esto devuelve los datos del usuario para procesarlos si es necesario. Si no se envía un token o no se envía un token válido, el endpoint no devuelve nada.