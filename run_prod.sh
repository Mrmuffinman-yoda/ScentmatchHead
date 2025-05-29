# build without cache and from clean state then bring up services
export COMPOSE_BAKE=true
docker compose build
docker compose up -d