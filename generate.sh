#!/usr/bin/env bash

mkdir "$1"
cd "$1" || exit 1

BASE=$(pwd)

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

# Not the executables
bin/

# Dependency directories
vendor/
EOF

mkdir cfg/
mkdir examples/

# binaries of the application. one to many.
mkdir cmd/
touch cmd/README.md

# bin directory
mkdir bin/
touch bin/README.md

#
mkdir pkg/
touch pkg/README.md

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

mkdir cmd/main
touch cmd/main/main.go
cat <<EOF > cmd/main/main.go
package main

import "fmt"

func main(){
	fmt.Println("success")
}
EOF

# Initialize go mod
cd "$BASE"
#cd cmd || exit 0
#go mod init
cat <<EOF > go.mod
module github.com/YOUR-USER-OR-ORG-NAME/YOUR-REPO-NAME

go 1.15
EOF

go build -o ./bin/main ./cmd/main
./bin/main

# Init the repo
git init
git add .
git commit -m 'First commit'

# Initialize pre-commit hooks
pre-commit install


echo "============="
echo "- Change the go mod with your repo"