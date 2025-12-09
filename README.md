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

**Recommended**: Use GitHub's "Use this template" button to create a clean copy, or clone directly:

```bash
# Clone template for new project
git clone https://github.com/yourusername/project-tempalte my-new-saas
cd my-new-saas

# If cloning (not using template feature), remove git history
rm -rf .git
git init
```

### 2. Initialize Applications

The template includes skeleton files. Initialize each stack:

```bash
# Frontend (SvelteKit)
cd frontend
npx sv create .
npm install
cd ..

# Backend (Python/FastAPI)
cd backend
# requirements.txt already exists, ready to use
cd ..

# Admin (Laravel)
cd admin
composer create-project laravel/laravel:^12.0 .
cd ..
```

### 3. Configure Environment

```bash
# Copy example environment file
cp .env.example .env

# Edit .env with your database credentials and app settings
nano .env
```

### 4. Start Docker Environment

```bash
# Build and start all services
docker compose up -d --build

# Wait for services to be healthy (~30 seconds)

# Setup Laravel
docker exec -it saas_admin php artisan key:generate
docker exec -it saas_admin php artisan migrate

# Verify all services are running
docker compose ps
```

### 5. Access Services

- **Frontend**: http://localhost:5173
- **Backend API**: http://localhost:8000/docs
- **Admin Panel**: http://localhost:8080
- **PostgreSQL**: localhost:5432
- **Redis**: localhost:6379

## Project Structure
