# SaaS Project Template

Reusable multi-stack SaaS template with SvelteKit frontend, Python FastAPI backend, and Laravel admin panel.

## Stack

- **Frontend**: SvelteKit (TypeScript)
- **Backend**: Python FastAPI
- **Admin**: Laravel 12
- **Database**: PostgreSQL 16
- **Cache**: Redis 7

## Quick Start

### 1. Clone and Setup

\`\`\`bash
# Clone template for new project
git clone <this-repo> my-new-saas
cd my-new-saas

# Remove git history (start fresh)
rm -rf .git
git init
\`\`\`

### 2. Initialize Applications

\`\`\`bash
# Frontend
cd frontend
npx sv create .
npm install
cd ..

# Backend
cd backend
# requirements.txt already exists
cd ..

# Admin
cd admin
composer create-project laravel/laravel:^12.0 .
cd ..
\`\`\`

### 3. Configure Environment

\`\`\`bash
# Copy and customize
cp .env.example .env

# Edit .env with your database credentials and app settings
\`\`\`

### 4. Start Docker Environment

\`\`\`bash
# Build and start all services
docker compose up -d --build

# Setup Laravel
docker exec -it saas_admin php artisan key:generate
docker exec -it saas_admin php artisan migrate

# Verify services
docker compose ps
\`\`\`

### 5. Access Services

- Frontend: http://localhost:5173
- Backend API: http://localhost:8000/docs
- Admin Panel: http://localhost:8080
- PostgreSQL: localhost:5432

## Project Structure

\`\`\`
.
├── docker-compose.yml      # All services orchestration
├── .env                    # Environment variables
├── docker/                 # Dockerfiles for each service
│   ├── frontend.Dockerfile
│   ├── backend.Dockerfile
│   └── admin.Dockerfile
├── nginx/
│   └── nginx.conf         # Reverse proxy config
├── frontend/              # SvelteKit app
├── backend/               # FastAPI app
├── admin/                 # Laravel app
└── shared/                # Shared JSON configs
    └── json/
