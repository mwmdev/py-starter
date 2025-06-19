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
      python3 -m venv venv
    fi

    # Activate virtual environment
    source venv/bin/activate

    # Install dependencies
    if [ -f "requirements.txt" ] && [ -s "requirements.txt" ]; then
      pip install -r requirements.txt
    fi
    
    # Install task-master-ai
    if [ ! -d "node_modules/task-master-ai" ]; then
      echo "Installing task-master-ai..."
      npm install task-master-ai
    fi

    # Install Claude code
    if [ ! -d "node_modules/@anthropic-ai/claude-code" ]; then
      echo "Installing Claude code..."
      npm install @anthropic-ai/claude-code
    fi

    echo "🚀 Development environment loaded!"
    echo "🐍 $(python --version)"
    echo "🌐 Node (node --version)"
    echo "🤖 Task Master $(cat node_modules/task-master-ai/package.json | jq -r '.version')"
    echo "🤖 Claude Code $(cat node_modules/@anthropic-ai/claude-code/package.json | jq -r '.version')"

  '';
} 