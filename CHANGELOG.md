# Changelog

All notable changes to the Dockit project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- FrankenPHP service with a custom Dockerfile providing Composer, Laravel-focused PHP extensions, and AMQP support.
- Environment variables, CLI updates, and documentation covering the FrankenPHP configuration and workflows.

## [v1.0.0] - 2025-10-25

### Added
- Interactive CLI manager (`dockit.sh`) for container orchestration
- Core services integration:
  - MySQL 8.2.0
  - PostgreSQL 15
  - Redis 7
  - Keycloak 26
- Container management features:
  - Build all containers
  - Start/stop individual or all containers
  - Container status information
  - Log viewing capability
- Unified network configuration (`devnet`)
- Persistent data volumes for all services
- Port configuration in 808x range to prevent conflicts

### Configuration
- Environment variables management through `.env`
- Customizable service ports
- Service-specific configurations in `config/` directory
- Volume mapping for data persistence

### Documentation
- Comprehensive README with setup instructions
- Detailed folder structure
- Usage examples and workflows
- Project task tracking
- Future roadmap for additional services

### Development
- Git integration with appropriate `.gitignore`
- Multi-platform support (Linux/macOS/WSL)
- Isolated service networking
- Container health monitoring

[v1.0.0]: https://github.com/tommyprmbd/dockit/releases/tag/v1.0.0
