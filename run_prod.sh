# build without cache and from clean state then bring up services
DOCKER_BUILDKIT=1 docker compose build --no-cache
docker compose up -d