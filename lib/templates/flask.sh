#!/usr/bin/env bash

scaffold_flask() {
    local project_name=$1
    
    log_info "Scaffolding Flask project..."
    
    mkdir -p "$project_name/app/"{routes,models,templates,static/css,static/js,utils}
    mkdir -p "$project_name/tests"
    
    cat > "$project_name/requirements.txt" << EOF
Flask==3.0.0
Flask-CORS==4.0.0
python-dotenv==1.0.0
EOF

    cat > "$project_name/app/__init__.py" << 'EOF'
from flask import Flask
from flask_cors import CORS
import os

def create_app():
    app = Flask(__name__)
    CORS(app)
    
    # Register blueprints (example)
    # from .routes import main_bp
    # app.register_blueprint(main_bp)
    
    @app.route('/')
    def index():
        return "Hello from Flask!"
        
    return app
EOF

    cat > "$project_name/run.py" << 'EOF'
from app import create_app

app = create_app()

if __name__ == "__main__":
    app.run(debug=True)
EOF

    cat > "$project_name/README.md" << EOF
# $project_name (Flask)

## Setup
\`\`\`bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python run.py
\`\`\`
EOF
}
