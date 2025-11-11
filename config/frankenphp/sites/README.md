# FrankenPHP per-project configs

Drop one `.caddy` file per project in this directory. Each file should define a
Caddy site block (e.g. `project.localhost:80 { ... }`) that points to the project
under `/app/<project-name>/<docroot>`. Files here are ignored by git (except this
README and the starter `default.caddy`) so local projects can be added without
polluting the repository history. The main `config/frankenphp/Caddyfile` imports
every `*.caddy` file found in this directory.

## Adding a new host/project

1. Ensure `config/frankenphp/frankenphp.env` exists (copy
   `frankenphp.env.example` if needed). This file is ignored by git and loaded by
   `docker-compose` via `env_file`.
2. Decide the project directory under `../playground/php` and the hostname you
   want (e.g. `todo.localhost:80`), then append env vars to
   `config/frankenphp/frankenphp.env`, for example:
   ```sh
   TODO_APP=todo-app
   TODO_HOST=todo.localhost:80
   ```
   No edits to `docker-compose.yml` are required—every key in this env file is
   available to Caddy inside the container.
3. Create `config/frankenphp/sites/todo.caddy` (copy `default.caddy` if you
   prefer) and point it at the new variables:
   ```caddy
   {$TODO_HOST} {
       root * /app/{$TODO_APP}/public
       php_server
       file_server
   }
   ```
4. Run `docker compose restart frankenphp` so Caddy loads the new site, and add
   the hostname to `/etc/hosts` if DNS does not already resolve it.
