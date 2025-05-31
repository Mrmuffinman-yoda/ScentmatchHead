# build without cache and from clean state then bring up services
cd ui
rm -rf node_modules pnpm-lock.yaml
pnpm install
cd ..
export COMPOSE_BAKE=true
docker compose build
docker compose up -d