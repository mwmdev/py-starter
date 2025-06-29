"""Pytest configuration file."""

import sys
from pathlib import Path

# Add src to Python path for test discovery
sys.path.insert(0, str(Path(__file__).parent / "src"))
