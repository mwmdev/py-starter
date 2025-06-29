"""Tests for my_package.cli module."""

import pytest
from unittest.mock import patch
import sys

from my_package.cli import main


class TestCLI:
    """Tests for CLI functionality."""

    def test_main_default(self, capsys):
        """Test CLI with default arguments."""
        with patch.object(sys, "argv", ["my-package"]):
            exit_code = main()

        captured = capsys.readouterr()
        assert exit_code == 0
        assert captured.out.strip() == "Hello, World!"

    def test_main_with_name(self, capsys):
        """Test CLI with custom name."""
        with patch.object(sys, "argv", ["my-package", "Alice"]):
            exit_code = main()

        captured = capsys.readouterr()
        assert exit_code == 0
        assert captured.out.strip() == "Hello, Alice!"

    def test_version(self, capsys):
        """Test version flag."""
        with patch.object(sys, "argv", ["my-package", "--version"]):
            with pytest.raises(SystemExit) as exc_info:
                main()

        assert exc_info.value.code == 0
        captured = capsys.readouterr()
        assert "my-package 0.1.0" in captured.out
