# 🐳 Dockit

> A unified local development stack for modern backend developers.

## 📘 Version
v1.0.0

## 👨‍💻 Developer / Contributors
- **Maintainer:** Tommyprmbd

## 🧱 Project Overview
Reusable local development environment built with Docker Compose.  
Includes MySQL 8.2.0, PostgreSQL 15, Redis 7, Keycloak 26, and a FrankenPHP runtime — all managed through the `dockit.sh` interactive CLI.

---

## 📁 Folder Structure
```
dockit/
├── config/            # Service configurations
├── data/             # Persistent data volumes
├── .env              # Environment variables and ports
├── docker-compose.yml # Service definitions
├── dockit.sh         # Interactive CLI manager
└── README.md         # Documentation
```

---

## ⚙️ Setup Instructions

### 1️⃣ Install Requirements
- Docker & Docker Compose
- Bash shell (Linux/macOS or WSL on Windows)

### 2️⃣ Configure Environment
Edit `.env` file to adjust ports or credentials:
```bash
MYSQL_PORT=8080
POSTGRES_PORT=8081
REDIS_PORT=8082
KEYCLOAK_PORT=8083
FRANKENPHP_HTTP_PORT=8084
FRANKENPHP_PROJECT_PATH=../playground/php
FRANKENPHP_DOCUMENT_ROOT=public
```
Adjust `FRANKENPHP_PROJECT_PATH` to point at your local PHP application (e.g. a Laravel project).

### 3️⃣ Manage Containers
Use the interactive script:

```bash
chmod +x dockit.sh
./dockit.sh
```

You’ll see menu options:
```
1) Build all containers
2) Start container(s)
3) Stop all containers
4) Show container info
5) View container logs
6) Exit
```

---

## 🧠 Example Workflows

**Start all containers:**
```bash
./dockit.sh → option 2 → all
```

**Start only MySQL & Redis:**
```bash
./dockit.sh → option 2 → mysql redis
```

**Serve a PHP app with FrankenPHP:**
```bash
./dockit.sh → option 2 → frankenphp
```

**View container logs:**
```bash
./dockit.sh → option 5 → mysql-dev
```

**Stop everything:**
```bash
./dockit.sh → option 3
```

---

## 📊 Notes
- All ports are in the 808x range to prevent conflicts.
- Data is persisted in Docker volumes (`mysql_data`, `postgres_data`, etc.).
- FrankenPHP mounts your application from `FRANKENPHP_PROJECT_PATH` and uses `FRANKENPHP_DOCUMENT_ROOT` for serving public files.
- Each service is isolated under the `devnet` network.
- You can safely extend this setup with additional services like **Mailpit**, **Adminer**, or **MinIO**.

---

## ✅ Project Tasks

Here is a summary of tasks currently being worked on for this repository:

| ID | Task | Description | Status |
|---:|------|------------|:-----:|
| 1 | Design `.gitignore` | Define patterns for files/directories to ignore (env, data volumes, certs, IDE, logs). Output: final `.gitignore` content. | completed |
| 2 | Apply `.gitignore` to repo | Use a patch to write `/home/tommy/envdev/.gitignore` with the designed content. | completed |
| 3 | Verification & guidance | Explain how to verify ignored files (`git status --ignored`, `git check-ignore`) and provide recommended commit commands. | not-started |
| 4 | Update README roadmap | Add a roadmap note indicating planned additions: a message broker (RabbitMQ), an API Gateway, and a Web Service. | completed |
| 5 | Insert todo table into README | Add a Markdown table containing the todo-list status into `README.md`. | completed |


## 🧩 License
MIT License © 2025 Tommyprmbd
