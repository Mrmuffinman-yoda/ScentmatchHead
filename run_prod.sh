#!/bin/bash
set -e
git pull
# Pull latest code for each repo
cd ui
git pull
pnpm install --frozen-lockfile
pnpm run build
cd ..

cd server
git pull
cd ..


# Remove old Next.js image
docker rmi -f scentmatch-nextjs:latest || true

# Enable BuildKit for faster builds
export DOCKER_BUILDKIT=1
echo "Building Next.js Docker image..."
docker compose build nextjs_1 # build single image for nextjs
echo "Starting containers..."
docker compose up -d