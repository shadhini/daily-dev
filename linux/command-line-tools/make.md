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

## Makefile Notation

A Makefile is a list of recipes.
- Each recipe has 
  - a name (`target`), 
  - a list of ingredients (`prerequisites`/`dependencies`), and 
  - the steps (`commands`) to make it. 
- When you run `make <target>`, 
  - make checks whether the target needs rebuilding (by looking at files/timestamps)
  - if yes, it runs the commands

```Makefile
# 1) "all" is the default target: run `make` to build it
.PHONY: all clean

all: hello        # target "all" depends on target/file "hello"

# 2) "hello" is built from "main.o"
hello: main.o
	# (this line MUST start with a TAB character)
	$(CC) -o $@ $^   # link: $@ = target name (hello), $^ = all prerequisites (main.o)

# 3) how to make a .o file from .c (pattern rule)
%.o: %.c
	$(CC) -c -o $@ $<  # $< = first prerequisite (the .c file)

# 4) clean up files (phony so it always runs)
clean:
	rm -f hello *.o
```

- Target line: `target: prerequisite1 prerequisite2`
   - Example: `hello: main.o`
   - Means “to make hello, I need main.o”.
- Recipe (commands): the lines below a target — they do the work.
   - Important: each command line must start with a real `TAB` character (not spaces).
   - Example: `(TAB)$(CC) -o $@ $^`
- Variables: you can use names for repeated values, e.g. `CC = gcc`
- Automatic variables (shortcuts inside recipes):
   - `$@` → the target’s name (the thing being made)
   - `$^` → all prerequisites (files needed)
   - `$<` → the first prerequisite (useful in compile rules)
- Pattern rule: `%.o: %.c` means `“to make X.o, use X.c”` — handy for many files.
- `.PHONY`: names listed here are not real files — they always run when requested.
   - Why: if a file called `clean` exists, without `.PHONY` make might think clean is already up-to-date and skip the commands. `.PHONY` avoids that.


How to use it (commands)
- `make`       → builds the first target (usually all)
- `make hello` → builds the hello target only
- `make clean` → runs the clean recipe (removes build files)

