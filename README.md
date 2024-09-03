# Tarea1_Software_Arquitecture

## BookReviewApp

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

### Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix



---

Te ayudaré a ejecutar la aplicación. Vamos a hacerlo paso a paso:

Primero, asegúrate de que estás en el directorio raíz de tu proyecto:

```bash
cd ~/Documents/Software\ Architecture/Tarea1_Software_Arquitecture/book_review_app
```

Ahora, vamos a asegurarnos de que todas las dependencias están instaladas:

```bash
mix deps.get
```

Si has hecho cambios en la base de datos o en las migraciones, es buena idea reiniciar desde cero:

```bash
mix ecto.drop
mix ecto.create
mix ecto.migrate
```

Ahora, vamos a cargar los datos de prueba:

```bash
mix run priv/repo/seeds.exs
```

Si todo ha ido bien hasta ahora, podemos iniciar el servidor de Phoenix:

```bash
mix phx.server
```

O si prefieres iniciarlo en modo interactivo:

```bash
iex -S mix phx.server
```

Una vez que el servidor esté en funcionamiento, deberías ver un mensaje que indica en qué puerto está corriendo la aplicación. Por defecto, suele ser el puerto 4000.

Abre tu navegador web y ve a http://localhost:4000. Deberías ver la página de inicio de tu aplicación.

Algunos consejos adicionales:

- Si estás utilizando una base de datos como PostgreSQL, asegúrate de que está en funcionamiento.
- Verifica que la configuración de la base de datos en config/dev.exs sea correcta.
- Si tienes problemas con las dependencias, puedes intentar eliminar la carpeta _build y el archivo mix.lock, y luego ejecutar mix deps.get nuevamente.


# IMPORTANTE

Para correr el codigo de forma correcta, se debe crear un archivo dentro de book_review_app/config con el nombre .env.exs y colocar el siguiente codigo:


```
System.put_env("DB_USERNAME", "myusername")
System.put_env("DB_PASSWORD", "mypassword")
```
> Reemplazar myusername y mypassword con el nombre de usuario y contraseña de postgres.



## Docker

y aqui en [book_review_app/docker-compose.yml](book_review_app/docker-compose.yml) en la linea 25 y 26 remplazar tambien por tus datos de postgresql

Y para correr la aplicacion con docker solo se debe correr el siguiente comando en la carpeta book_review_app

### Ejecutar Aplicación + Base de datos:
```bash
docker-compose -f docker-compose.app-db.yml up --build
```

### Aplicación + Base de datos + Caché
```bash
docker-compose -f docker-compose.app-db-cache.yml up --build
``` 


### Aplicación + Base de datos + Motor de búsqueda
```bash
docker-compose -f docker-compose.app-db-search.yml up --build
```

### Ejecutar Aplicación + Base de datos + Proxy inverso:
```bash
docker-compose -f docker-compose.app-db-proxy.yml up --build
```

### Aplicación + Base de datos + Proxy inverso + Caché + Motor de búsqueda
```bash
docker-compose -f docker-compose.app-db-proxy-cache-search.yml up --build
```

