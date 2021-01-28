#!/usr/bin/env bash

mkdir "$1"
cd "$1" || exit 1

BASE=$(pwd)

#touch CONTRIBUTORS
touch MAINTAINERS.md
touch LICENSE
touch Makefile

cat <<EOF > README.md
#

[![Actions Status]()]()
![](https://img.shields.io/maintenance/yes/2021.svg)

## Maintainers

-   [Module maintainers](MAINTAINERS.md)
EOF

cat <<EOF > .pre-commit-config.yaml
repos:
  - repo: git://github.com/dnephin/pre-commit-golang
    rev: master
    hooks:
      - id: go-fmt
#      - id: go-vet
      - id: go-lint
#      - id: go-imports
#      - id: go-cyclo
#        args: [-over=15]
#      - id: validate-toml
#      - id: no-go-testing
#      - id: gometalinter
#      - id: golangci-lint
#      - id: go-critic
#      - id: go-unit-tests
#      - id: go-build
#      - id: go-mod-tidy
EOF

cat <<EOF > .gitignore
.idea

# Binaries for programs and plugins
*.exe
*.exe~
*.dll
*.so
*.dylib

# Test binary, built with `go test -c`
*.test

# Output of the go coverage tool, specifically when used with LiteIDE
*.out

# Dependency directories
vendor/
EOF

mkdir cfg/
mkdir examples/

# binaries of the application. one to many.
mkdir cmd/
touch cmd/README.md

# business logic. reusable between binaries. files to organize
# cannot import from cmd
mkdir internal/
touch internal/README.md
# for foundation packages
mkdir internal/platform
touch internal/platform/README.md

# cannot import from cmd/internal
mkdir vendors
touch vendors/README.md

# scripts for Makefile
mkdir scripts/
touch scripts/README.md

# Initialize go mod
cd "$BASE"
cd cmd || exit 0
go mod init

# Initialize pre-commit hooks
pre-commit install