FROM node:20-alpine

WORKDIR /app

# Install pnpm (optional, or use npm)
RUN npm install -g pnpm

# Copy package files
COPY frontend/package.json frontend/pnpm-lock.yaml* frontend/package-lock.json* ./

# Install dependencies
RUN if [ -f pnpm-lock.yaml ]; then pnpm install; \
    elif [ -f package-lock.json ]; then npm ci; \
    else npm install; fi

# Copy application
COPY frontend/ .

EXPOSE 5173

CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]
