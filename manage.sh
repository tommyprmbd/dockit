#!/bin/bash
set -e
ENV_FILE=".env"

if [ ! -f "$ENV_FILE" ]; then
  echo "❌ .env file not found."
  exit 1
fi

source "$ENV_FILE"

show_banner() {
  clear
  echo "==========================================="
  echo " 🧩 Dev Container Manager (Interactive CLI)"
  echo "==========================================="
  echo ""
}

show_menu() {
  echo "1) Build all containers"
  echo "2) Start container(s)"
  echo "3) Stop all containers"
  echo "4) Show container info"
  echo "5) View container logs"
  echo "6) Exit"
  echo ""
  read -p "Select an option: " CHOICE
}

build_containers() {
  echo "🚧 Pulling & building containers..."
  docker compose --env-file .env pull
  echo "✅ Build completed."
}

start_containers() {
  echo "Available services: mysql postgres redis keycloak"
  read -p "Enter service(s) to start (space-separated or 'all'): " SERVICES
  if [ "$SERVICES" == "all" ]; then
    docker compose --env-file .env up -d
  else
    docker compose --env-file .env up -d $SERVICES
  fi
  echo "✅ Containers started."
}

stop_containers() {
  docker compose --env-file .env stop
  echo "🛑 Containers stopped."
}

show_info() {
  echo "==============================="
  echo "🔧 CURRENT CONFIGURATION"
  echo "==============================="
  echo "Network: ${NETWORK_NAME}"
  printf "MySQL		: %s (%s:%s)
" "$MYSQL_VERSION" "localhost" "$MYSQL_PORT"
  printf "Postgres	: %s (%s:%s)
" "$POSTGRES_VERSION" "localhost" "$POSTGRES_PORT"
  printf "Redis		: %s (%s:%s)
" "$REDIS_VERSION" "localhost" "$REDIS_PORT"
  printf "Keycloak	: %s (%s:%s)
" "$KEYCLOAK_VERSION" "localhost" "$KEYCLOAK_PORT"
  echo ""
  echo "🧠 Running containers:"
  docker --env-file .env ps --format "table {{.Names}}	{{.Image}}	{{.Ports}}"
}

view_logs() {
  echo "Available containers:"
  docker --env-file .env ps --format "{{.Names}}" || echo "No containers running."
  echo ""
  read -p "Enter container name to view logs: " cname
  if [ -n "$cname" ]; then
    docker logs -f "$cname"
  else
    echo "⚠️ No container specified."
  fi
}

while true; do
  show_banner
  show_menu
  case $CHOICE in
    1) build_containers; read -p "Press Enter to continue...";;
    2) start_containers; read -p "Press Enter to continue...";;
    3) stop_containers; read -p "Press Enter to continue...";;
    4) show_info; read -p "Press Enter to continue...";;
    5) view_logs; read -p "Press Enter to continue...";;
    6) echo "👋 Exiting..."; exit 0;;
    *) echo "Invalid option"; sleep 1;;
  esac
done
