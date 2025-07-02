#!/bin/bash
PURPLE='\033[1;35m'
PINK='\e[38;5;212m'
NC='\033[0m'

echo -e "${PINK}<${NC}${PURPLE}Booting Development environment${NC}${PINK}>${NC}"


export COMPOSE_BAKE=true
docker compose -f docker-compose.dev.yml up --build
