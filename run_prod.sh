#!/bin/bash
set -e

# Define cache locations
CACHE_DIR="$HOME/.scentmatch_cache"
CACHE_NODE_MODULES="$CACHE_DIR/node_modules"
CACHE_NEXT="$CACHE_DIR/.next"

mkdir -p "$CACHE_DIR"

# Restore node_modules cache if exists
if [ -d "$CACHE_NODE_MODULES" ]; then
  echo "Restoring node_modules from cache..."
  rm -rf ui/node_modules
  cp -r "$CACHE_NODE_MODULES" ui/node_modules
fi

# Restore .next cache if exists
if [ -d "$CACHE_NEXT" ]; then
  echo "Restoring .next from cache..."
  rm -rf ui/.next
  cp -r "$CACHE_NEXT" ui/.next
fi

# Pull latest code for each repo
cd ui
git pull
pnpm install --frozen-lockfile
pnpm run build
cd ..

cd server
git pull
cd ..

# Save node_modules and .next to cache
cp -r ui/node_modules "$CACHE_NODE_MODULES"
cp -r ui/.next "$CACHE_NEXT"

# Ensure buildx cache directory exists for BuildKit
mkdir -p ui/.buildx-cache

# Remove old Next.js image
docker rmi -f scentmatch-nextjs:latest || true

# Enable BuildKit for faster builds
export DOCKER_BUILDKIT=1
docker compose build nextjs_1 # build single image for nextjs
docker compose up -d