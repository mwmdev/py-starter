"""Core functionality for my_package."""


def hello_world(name: str = "World") -> str:
    """
    Generate a greeting message.

    Args:
        name: The name to greet. Defaults to "World".

    Returns:
        A greeting message.

    Example:
        >>> hello_world()
        'Hello, World!'
        >>> hello_world("Alice")
        'Hello, Alice!'
    """
    return f"Hello, {name}!"
