#!/usr/bin/env bash

scaffold_nodejs_fullstack() {
    local project_name=$1
    
    log_info "Scaffolding Node.js Fullstack project..."
    
    # Backend
    mkdir -p "$project_name/server/src/"{config,controllers,models,routes,middlewares}
    
    cat > "$project_name/server/package.json" << 'EOF'
{
  "name": "server",
  "version": "1.0.0",
  "scripts": {
    "dev": "nodemon src/index.js",
    "start": "node src/index.js"
  },
  "dependencies": {
    "express": "^4.19.2",
    "cors": "^2.8.5",
    "dotenv": "^16.0.3"
  },
  "devDependencies": {
    "nodemon": "^3.1.4"
  }
}
EOF

    cat > "$project_name/server/src/index.js" << 'EOF'
const express = require('express');
const cors = require('cors');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());

app.get('/', (req, res) => {
    res.send('API is running...');
});

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
EOF

    # Frontend
    mkdir -p "$project_name/client/src/"{components,pages,context,hooks,utils}
    
    cat > "$project_name/client/package.json" << 'EOF'
{
  "name": "client",
  "version": "0.1.0",
  "dependencies": {
    "react": "^18.3.1",
    "react-dom": "^18.3.1",
    "react-scripts": "5.0.1",
    "axios": "^1.6.0"
  },
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test",
    "eject": "react-scripts eject"
  },
  "eslintConfig": {
    "extends": [
      "react-app",
      "react-app/jest"
    ]
  },
  "browserslist": {
    "production": [
      ">0.2%",
      "not dead",
      "not op_mini all"
    ],
    "development": [
      "last 1 chrome version",
      "last 1 firefox version",
      "last 1 safari version"
    ]
  }
}
EOF

    log_info "Installing backend dependencies..."
    (cd "$project_name/server" && npm install)
    
    log_info "Installing frontend dependencies..."
    (cd "$project_name/client" && npm install)

    echo "## Backend: cd server && npm run dev" >> "$project_name/README.md"
    echo "## Frontend: cd client && npm start" >> "$project_name/README.md"
}
