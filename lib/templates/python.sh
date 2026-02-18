#!/usr/bin/env bash

scaffold_python() {
    local project_name=$1
    
    log_info "Scaffolding Python project..."
    
    mkdir -p "$project_name/"{src,tests,docs}
    touch "$project_name/src/__init__.py"
    touch "$project_name/tests/__init__.py"
    
    cat > "$project_name/pyproject.toml" << EOF
[build-system]
requires = ["setuptools>=61.0"]
build-backend = "setuptools.build_meta"

[project]
name = "$project_name"
version = "0.1.0"
description = "A new Python project"
authors = [{name = "Author Name", email = "author@example.com"}]
dependencies = []
requires-python = ">=3.8"

[project.optional-dependencies]
dev = ["pytest", "black", "isort", "mypy", "flake8"]

[tool.pytest.ini_options]
testpaths = ["tests"]
python_files = ["test_*.py"]
EOF

    cat > "$project_name/src/main.py" << 'EOF'
def main():
    print("Hello from Python project!")

if __name__ == "__main__":
    main()
EOF

    cat > "$project_name/tests/test_main.py" << 'EOF'
def test_example():
    assert True
EOF

    echo "## Setup: python3 -m venv venv && source venv/bin/activate && pip install -e .[dev]" >> "$project_name/README.md"
}
