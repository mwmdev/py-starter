"""Tests for my_package.core module."""

import pytest

from my_package.core import hello_world


class TestHelloWorld:
    """Tests for hello_world function."""

    def test_default_greeting(self):
        """Test hello_world with default argument."""
        assert hello_world() == "Hello, World!"

    def test_custom_greeting(self):
        """Test hello_world with custom name."""
        assert hello_world("Alice") == "Hello, Alice!"

    @pytest.mark.parametrize(
        "name,expected",
        [
            ("Bob", "Hello, Bob!"),
            ("Charlie", "Hello, Charlie!"),
            ("", "Hello, !"),
            ("123", "Hello, 123!"),
            ("John Doe", "Hello, John Doe!"),
        ],
    )
    def test_various_names(self, name, expected):
        """Test hello_world with various inputs."""
        assert hello_world(name) == expected
