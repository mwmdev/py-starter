{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    python312
    python312Packages.pip
    python312Packages.virtualenv
    python312Packages.build
    python312Packages.twine
    nodejs
    nodePackages.npm
    jq
    mypy
    pre-commit
  ];

  shellHook = ''

    # Create virtual environment
    if [ ! -d ".venv" ]; then
      echo "Creating virtual environment..."
      python3 -m venv .venv
    fi

    # Activate virtual environment
    source .venv/bin/activate

    # Install package in development mode
    if [ -f "pyproject.toml" ]; then
      echo "Installing package in development mode..."
      pip install -e ".[dev]"
    elif [ -f "requirements.txt" ] && [ -s "requirements.txt" ]; then
      pip install -r requirements.txt
    fi

    # Install pre-commit hooks if available
    if [ -f ".pre-commit-config.yaml" ]; then
      pre-commit install
    fi

    echo "🚀 Development environment loaded!"
    echo "🐍 $(python --version)"
    echo "🌐 Node $(node --version)"
    echo "📦 Project: my-package"
    echo ""
    echo "Available commands:"
    echo "  pytest           - Run tests"
    echo "  pytest --cov     - Run tests with coverage"
    echo "  mypy src         - Type check"
    echo "  python -m build  - Build package"
    echo ""
    echo "Note: Ruff is installed via pip but may have issues on NixOS."
    echo "Consider using a container or VM for ruff operations."

  '';
}
