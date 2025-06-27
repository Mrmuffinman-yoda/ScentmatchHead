#!/bin/bash

PURPLE='\033[1;35m'
PINK='\e[38;5;212m'
NC='\033[0m'

echo -e "${PINK}<${NC}${PURPLE}Shutting down all related containers and volumes${NC}${PINK}>${NC}"

docker compose -f docker-compose.dev.yml down -v
docker compose -f docker-compose.test.yml down -v
docker compose down -v