# My Package

[![PyPI version](https://badge.fury.io/py/my-package.svg)](https://badge.fury.io/py/my-package)
[![Python versions](https://img.shields.io/pypi/pyversions/my-package.svg)](https://pypi.org/project/my-package/)
[![License](https://img.shields.io/github/license/yourusername/my-package.svg)](https://github.com/yourusername/my-package/blob/main/LICENSE)
[![Tests](https://github.com/yourusername/my-package/actions/workflows/tests.yml/badge.svg)](https://github.com/yourusername/my-package/actions/workflows/tests.yml)
[![Coverage](https://codecov.io/gh/yourusername/my-package/branch/main/graph/badge.svg)](https://codecov.io/gh/yourusername/my-package)

A professional Python package template ready for PyPI publication.

## Features

- Modern Python packaging with `pyproject.toml`
- Comprehensive test suite with pytest
- Code quality tools (ruff, mypy, pre-commit)
- Type hints throughout
- CLI interface
- GitHub Actions for CI/CD
- Ready for PyPI publication

## Installation

### From PyPI

```bash
pip install my-package
```

### From Source

```bash
git clone https://github.com/yourusername/my-package.git
cd my-package
pip install -e ".[dev]"
```

## Usage

### As a Library

```python
from my_package import hello_world

# Basic usage
message = hello_world()
print(message)  # Output: Hello, World!

# Custom greeting
message = hello_world("Alice")
print(message)  # Output: Hello, Alice!
```

### Command Line Interface

```bash
# Default greeting
my-package

# Custom greeting
my-package Alice

# Show version
my-package --version
```

## Development

### Setup Development Environment

This project uses Nix for reproducible development environments:

```bash
# With direnv (automatic)
cd my-package
# Environment activates automatically

# Without direnv
nix-shell
```

### Install Development Dependencies

```bash
pip install -e ".[dev]"
pre-commit install
```

### Running Tests

```bash
# Run all tests
pytest

# Run with coverage
pytest --cov

# Run specific test file
pytest tests/test_core.py
```

### Code Quality

```bash
# Format code
ruff format

# Lint code
ruff check --fix

# Type checking
mypy src

# Run all pre-commit hooks
pre-commit run --all-files
```

### Building and Publishing

```bash
# Build the package
python -m build

# Upload to TestPyPI
python -m twine upload --repository testpypi dist/*

# Upload to PyPI
python -m twine upload dist/*
```

## Project Structure

```
my-package/
├── src/
│   └── my_package/
│       ├── __init__.py
│       ├── core.py
│       └── cli.py
├── tests/
│   ├── __init__.py
│   ├── test_core.py
│   └── test_cli.py
├── docs/
├── .github/
│   └── workflows/
│       └── tests.yml
├── pyproject.toml
├── README.md
├── LICENSE
├── CHANGELOG.md
├── shell.nix
└── .gitignore
```

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Built with modern Python packaging standards
- Uses best practices for Python development
- Ready for immediate use and customization
