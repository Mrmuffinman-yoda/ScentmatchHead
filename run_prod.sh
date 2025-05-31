# build without cache and from clean state then bring up services
cd ui
git pull
rm -rf node_modules pnpm-lock.yaml
pnpm install
cd ..
cd server
git pull
cd ..
git pull
export COMPOSE_BAKE=true
docker compose build
docker compose up -d