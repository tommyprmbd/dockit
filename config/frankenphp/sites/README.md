# FrankenPHP per-project configs

Drop one `.caddy` file per project in this directory. Each file should define a
Caddy site block (e.g. `project.localhost:80 { ... }`) that points to the project
under `/app/<project-name>/<docroot>`. Files here are ignored by git (except this
README and the starter `default.caddy`) so local projects can be added without
polluting the repository history. The main `config/frankenphp/Caddyfile` imports
every `*.caddy` file found in this directory.

## Adding a new host/project

1. Pick the local project directory (`../playground/php/<project-name>`) and the
   hostname you want to serve it on (e.g. `todo.localhost:80`).
2. Add the necessary environment variables to `.env` **and** `.env.example`, for
   example `TODO_APP=todo-app` and `TODO_HOST=todo.localhost:80`.
3. Expose those variables to the container by registering them in the
   `frankenphp` service `environment` block inside `docker-compose.yml`:
   ```yaml
   environment:
     TODO_APP: ${TODO_APP}
     TODO_HOST: ${TODO_HOST}
   ```
4. Create `config/frankenphp/sites/todo.caddy` (copy `default.caddy` if you
   prefer) and adjust it to point at the project:
   ```caddy
   {$TODO_HOST} {
       root * /app/{$TODO_APP}/public
       php_server
       file_server
   }
   ```
5. Run `docker compose restart frankenphp` so Caddy loads the new site, and add
   the hostname to `/etc/hosts` if DNS does not already resolve it.
