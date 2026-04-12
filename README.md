# Transcendence

## Build dependencies
- Node.js v24+
- npm
- Docker and Docker Compose
- Git

## Node modules used
- nuxt
- @nuxt/eslint
- drizzle-orm
- drizzle-kit
- zod

## Initial dev setup

```bash
# 1. Copy the environment file
cp .env.example .env

# 2. Install all dependencies
npm install

# 3. Start the Postgres container
docker compose up -d

# 4. Push the schema to the newly created database
npm run db:push

# 5. Populate the database with some test data
npm run db:seed

# 6. Start the server
npm run dev
```

Eventually, the goal will be to deploy everything with a single command but I think it's best to start simple before getting into any premature refactoring.

## Available dev commands

```bash
# Start dev server (main command)
npm run dev

# Check code style
npm run lint
npm run lint:fix

# Database operations
npm run db:push
npm run db:seed

# Start Drizzle Studio
npx drizzle-kit studio
```
