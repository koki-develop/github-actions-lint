# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This repository provides GitHub Actions for linting GitHub Actions workflows. It packages three popular GitHub Actions linting tools:
- **actionlint**: Static checker for GitHub Actions workflow files
- **ghalint**: Policy as Code tool for GitHub Actions workflows
- **zizmor**: Security-focused GitHub Actions workflow linter

## Architecture

The project is structured as a multi-component monorepo:
- Each linting tool has its own action definition in `/{tool-name}/action.yml`
- Docker images for each tool are built from `dockerfiles/{tool-name}/`
- Each Docker image includes an entrypoint script that runs the respective linting tool
- Release Please manages independent versioning for each component

## Common Development Commands

### Building Docker Images Locally
```bash
# Build all images
docker compose build

# Build specific tool
docker compose build actionlint
docker compose build ghalint
docker compose build zizmor
```

### Running Linters Locally
```bash
# Run actionlint
docker compose run --rm actionlint

# Run ghalint
docker compose run --rm ghalint

# Run zizmor
docker compose run --rm zizmor
```

### Testing GitHub Actions
The repository uses its own actions for CI testing. To test changes:
1. Make modifications to the action files or Docker configurations
2. The CI workflow `.github/workflows/ci-action.yml` will automatically test the actions on pull requests

## Key Implementation Details

### Docker Image Versioning
- Each tool's Docker image is versioned independently via release-please
- Image tags are referenced in the action.yml files (e.g., `ghcr.io/koki-develop/github-actions-lint/actionlint:0.0.4`)
- When updating tool versions, update the Dockerfile and create a release

### Entrypoint Scripts
Each tool has an entrypoint script that:
- actionlint: Runs with color and verbose output
- ghalint: Runs both `ghalint run` and `ghalint run-action` with passed arguments
- zizmor: Configures GitHub token from input and runs with specified persona

### Action Inputs
- actionlint: No inputs (runs with default settings)
- ghalint: Optional `action-path` input for specifying action files to lint
- zizmor: Optional `github-token` and `persona` inputs for enhanced security scanning