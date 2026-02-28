# Make

`make` is a command‑line tool 
- the program that reads a Makefile and runs build commands

# Makefiles

`used in various scenarios to automate repetitive tasks`

## Common Scenarios Where Makefiles Are Used
1. Build Automation
    - Compiling C/C++, Java, Go programs from source code
    - Running preprocessors, linters, and compilers in sequence
    - Managing dependencies between object files and source files
2. Development Workflows
    - Setup tasks: Installing dependencies, initializing databases
    - Running dev servers: Starting local development environments
    - Testing: Running unit tests, integration tests, code coverage
    - Cleaning: Removing build artifacts, temporary files, cache
3. Docker & Container Management
    - Building Docker images with specific tags
    - Starting/stopping containers and services
    - Managing multi-container setups with Docker Compose
    - Generating secrets and configurations
    - Deploying to production
4. Project Maintenance
    - Documentation: Generating docs from source files
    - Code quality: Running linters, formatters, static analysis
    - Releases: Versioning, tagging, packaging
    - Deployments: Pushing to registries, rolling updates
5. CI/CD Pipelines
    - Running automated tests
    - Building artifacts
    - Deploying applications
    - Notifying teams
6. Multi-language Projects
    - Running different build tools for different languages
    - Coordinating builds across frontend (npm), backend (mvn), services (docker)

## Why Use Makefiles?
✅ Consistency - Same commands work everywhere (Linux, Mac, even Windows with WSL)
✅ Documentation - make help shows what's available
✅ Dependency tracking - Avoids unnecessary rebuilds
✅ Readability - Self-documenting compared to shell scripts
✅ Automation - Chains multiple commands into single target
✅ Team collaboration - Everyone uses the same commands
