# Generator for new projects in golang

[![License: MIT](https://img.shields.io/badge/license-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![](https://img.shields.io/maintenance/yes/2021.svg)
![golang](https://img.shields.io/badge/golang-1.15-green.svg)

- https://github.com/golang-standards/project-layout

Other external projects like this:

- https://github.com/golang-standards/project-layout/tree/master/scripts

## Requirements

- go 1.15
- [golint](https://github.com/golang/lint)

## Usage

Clone the repo and then:

    ./go-project-generator/generate.sh my-project

## TODO

- Add github action
- Fail if golint is not installed
- Add example of tracing