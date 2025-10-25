# 🧩 Dev Environment Docker Stack

## 📘 Version
v1.0.0

## 👨‍💻 Developer / Contributors
- **Maintainer:** Tommyprmbd (Senior DevOps)

## 🧱 Project Overview
Reusable local development environment built with Docker Compose.  
Includes MySQL 8.2.0, PostgreSQL 15, Redis 7, and Keycloak 26 — all managed through a single `manage.sh` interactive CLI.

---

## 📁 Folder Structure
```
DevEnv/
├── config              # Configuration files for each service 
├── data                # Persistent data volumes
├── .env                # All environment variables (ports, credentials, etc)
├── docker-compose.yml  # Docker service configuration
├── manage.sh           # Interactive container manager
└── README.md           # Project documentation
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
```

### 3️⃣ Manage Containers
Use the interactive script:

```bash
chmod +x manage.sh
./manage.sh
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
./manage.sh → option 2 → all
```

**Start only MySQL & Redis:**
```bash
./manage.sh → option 2 → mysql redis
```

**View container logs:**
```bash
./manage.sh → option 5 → mysql-dev
```

**Stop everything:**
```bash
./manage.sh → option 3
```

---

## 📊 Notes
- All ports are in the 808x range to prevent conflicts.
- Data is persisted in Docker volumes (`mysql_data`, `postgres_data`, etc.).
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
MIT License © 2025 Tommyprmbd (SALT)
