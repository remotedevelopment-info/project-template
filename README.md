# SaaS Project Template

Reusable multi-stack SaaS template with SvelteKit frontend, Python FastAPI backend, and Laravel admin panel.

## Stack

- **Frontend**: SvelteKit (TypeScript)
- **Backend**: Python FastAPI
- **Admin**: Laravel 12
- **Database**: PostgreSQL 16
- **Cache**: Redis 7

## Quick Start

### 1. Clone Template via GitHub

**Recommended**: Use GitHub's "Use this template" button to create a clean copy.

```bash
# Your new project will be created on GitHub, then clone it
git clone https://github.com/yourusername/my-new-saas
cd my-new-saas
```

### 2. Rename Project (Replace saas_ with your project name)

```bash
# Set your project name
PROJECT_NAME="myproject"

# Update docker-compose.yml
sed -i '' "s/saas_/${PROJECT_NAME}_/g" docker-compose.yml
sed -i '' "s/saas_network/${PROJECT_NAME}_network/g" docker-compose.yml

# Update .env files
sed -i '' "s/saas_/${PROJECT_NAME}_/g" .env.example
sed -i '' "s/saas_db/${PROJECT_NAME}_db/g" .env.example
cp .env.example .env

# Note: On Linux, remove the '' after -i in sed commands
# sed -i "s/saas_/${PROJECT_NAME}_/g" docker-compose.yml
```

### 3. Initialize Applications

**Important**: Install dependencies locally BEFORE building Docker containers.

```bash
# Frontend (SvelteKit)
cd frontend
npx sv create .
npm install
cd ..

# Backend (Python/FastAPI)
cd backend
# requirements.txt already exists, nothing to do
cd ..

# Admin (Laravel) - MUST run composer locally
cd admin
composer create-project laravel/laravel:^12.0 .
# This installs vendor/ directory which Docker needs
cd ..
```

### 4. Configure Environment

```bash
# Main .env is already created from step 2

# Laravel needs its own .env configured for Docker
cat > admin/.env << 'EOF'
APP_NAME=MyProject
APP_ENV=local
APP_KEY=
APP_DEBUG=true
APP_URL=http://localhost:8080

DB_CONNECTION=pgsql
DB_HOST=postgres
DB_PORT=5432
DB_DATABASE=myproject_db
DB_USERNAME=saas_user
DB_PASSWORD=saas_pass

CACHE_DRIVER=redis
SESSION_DRIVER=redis
QUEUE_CONNECTION=redis

REDIS_HOST=redis
REDIS_PASSWORD=null
REDIS_PORT=6379
EOF
```

### 5. Update SvelteKit Config for Docker

```bash
# Update vite.config.ts to work in Docker
cat > frontend/vite.config.ts << 'EOF'
import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vite';

export default defineConfig({
  plugins: [sveltekit()],
  server: {
    host: '0.0.0.0',
    port: 5173,
    watch: {
      usePolling: true
    }
  }
});
EOF
```

### 6. Start Docker Environment

```bash
# Build and start all services
docker compose up -d --build

# Wait for services to be healthy (~30 seconds)

# Setup Laravel (generate app key and run migrations)
docker exec -it ${PROJECT_NAME}_admin php artisan key:generate
docker exec -it ${PROJECT_NAME}_admin php artisan migrate

# Verify all services are running
docker compose ps
```

### 7. Access Services

- **Frontend**: http://localhost:5173
- **Backend API**: http://localhost:8000/docs
- **Admin Panel**: http://localhost:8080
- **PostgreSQL**: localhost:5432
- **Redis**: localhost:6379

## Project Structure
