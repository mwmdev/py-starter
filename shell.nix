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

    # Create a virtual environment
    if [ ! -d "venv" ]; then
      echo "Creating virtual environment..."
      python3 -m venv venv
    fi

    # Activate the virtual environment
    source venv/bin/activate

    # Install dependencies if requirements.txt exists and has content
    if [ -f "requirements.txt" ] && [ -s "requirements.txt" ]; then
      pip install -r requirements.txt
    fi
    
    # Install task-master-ai if not already installed
    if [ ! -d "node_modules/task-master-ai" ]; then
      echo "Installing task-master-ai..."
      npm install task-master-ai
    fi

    echo "🚀 Development environment loaded!"
    echo "🐍 $(python --version)"
    echo "🌐 Node (node --version)"
    echo "🤖 Task Master $(cat node_modules/task-master-ai/package.json | jq -r '.version')"

  '';
} 