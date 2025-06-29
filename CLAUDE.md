# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a professional Python package template ready for PyPI publication. It provides a complete foundation for Python packages with modern packaging standards, comprehensive testing, and CI/CD automation.

## Commands

### Testing
```bash
# Run all tests
pytest

# Run tests with coverage report
pytest --cov

# Run tests with coverage and generate HTML report
pytest --cov --cov-report=html

# Run a specific test file
pytest tests/test_core.py

# Run a specific test class
pytest tests/test_core.py::TestHelloWorld

# Run a specific test method
pytest tests/test_core.py::TestHelloWorld::test_default_greeting

# Run tests matching a pattern
pytest -k "test_custom"
```

### Code Quality
```bash
# Format code (auto-fixes)
ruff format src tests

# Check linting issues
ruff check src tests

# Fix linting issues automatically
ruff check --fix src tests

# Type checking
mypy src

# Run all pre-commit hooks
pre-commit run --all-files
```

### Building and Publishing
```bash
# Build the package (creates dist/ directory)
python -m build

# Check package metadata
twine check dist/*

# Upload to TestPyPI (for testing)
python -m twine upload --repository testpypi dist/*

# Upload to PyPI (for production release)
python -m twine upload dist/*
```

### Development
```bash
# Install package in development mode with all dev dependencies
pip install -e ".[dev]"

# Install pre-commit hooks
pre-commit install

# Run the CLI
my-package
my-package --help
my-package "Custom Name"
```

## Architecture Overview

### Package Structure
The project uses a **src layout** which provides better isolation between the package code and tests, preventing accidental imports of test code in production.

```
src/my_package/
├── __init__.py      # Package metadata and exports
├── core.py          # Core business logic
└── cli.py           # Command-line interface
```

### Key Design Decisions

1. **Version Management**: Single source of truth in `src/my_package/__init__.py`. The version is automatically read by hatchling during build.

2. **CLI Entry Point**: Defined in `pyproject.toml` under `[project.scripts]`. The `my-package` command maps to `my_package.cli:main`.

3. **Testing Strategy**:
   - Uses pytest with fixtures for reusable test components
   - Parameterized tests for testing multiple scenarios efficiently
   - Coverage tracking configured to exclude non-essential code patterns
   - Tests are kept separate from source code for clean packaging

4. **Type Safety**: Full type annotations throughout with strict mypy configuration ensuring type correctness.

5. **Import Management**: The `__all__` export in `__init__.py` controls the public API surface.

## Development Environment

The project uses **Nix** for reproducible development environments:
- Python 3.12 with virtual environment at `.venv`
- Development tools included: mypy, pre-commit, pytest, build, twine
- Dependencies are automatically installed in development mode
- Pre-commit hooks are automatically installed

**Note**: Ruff is installed via pip but may have dynamic linking issues on NixOS. Consider using a container or VM for ruff operations, or running ruff checks in CI/CD.

## CI/CD Pipeline

GitHub Actions workflows handle:
- **Testing** (`tests.yml`): Runs on push/PR across multiple OS and Python versions
- **Publishing** (`publish.yml`): Automatically publishes to PyPI on release

## Configuration Files

- `pyproject.toml`: Central configuration for package metadata, dependencies, and tool settings
- `.pre-commit-config.yaml`: Automated code quality checks before commits
- `shell.nix`: Nix development environment configuration

## Development Best Practices

- **Third-Party Libraries**: When using a third party python library, always lookup the documentation using context7
