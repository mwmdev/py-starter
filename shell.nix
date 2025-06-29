{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    python312
    python3Packages.pip
    python3Packages.virtualenv
    nodejs
    nodePackages.npm
    jq
  ];

  shellHook = ''

    # Create virtual environment
    if [ ! -d "venv" ]; then
      echo "Creating virtual environment..."
      python3 -m venv .venv
    fi

    # Activate virtual environment
    source venv/bin/activate

    # Install dependencies
    if [ -f "requirements.txt" ] && [ -s "requirements.txt" ]; then
      pip install -r requirements.txt
    fi

    echo "🚀 Development environment loaded!"
    echo "🐍 $(python --version)"
    echo "🌐 Node $(node --version)"

  '';
}
