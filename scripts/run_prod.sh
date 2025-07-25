#!/bin/bash
YELLOW='\033[1;33m'
PURPLE='\033[1;35m'
PINK='\e[38;5;212m'
NC='\033[0m'

echo -e "${PINK}<${NC}${PURPLE}Booting Production environment${NC}${PINK}>${NC}"

set -e
set -a
# Load environment variables from .env file
source ./config/env/.env.prod
set +a

echo -e "${PINK}<${NC}${PURPLE}Updating local repositories${NC}${PINK}>${NC}"

(
  cd ui && git pull
) &

(
  cd server && git pull
) &

wait

# Remove old Next.js image (ignore errors)
docker rmi -f scentmatch-nextjs:latest || true

# Enable BuildKit for faster builds
export DOCKER_BUILDKIT=1
export COMPOSE_BAKE=true

echo -e "${PINK}<${NC}${PURPLE}Building required container images (build inside Docker now)${NC}${PINK}>${NC}"
docker compose build

echo -e "${PINK}<${NC}${PURPLE}Starting containers${NC}${PINK}>${NC}"
docker compose up -d

echo -e "${YELLOW}"
cat <<'EOF'
 _____                     _                      _          _      
/  ___|                   | |                    | |        | |     
\ `--.   ___   ___  _ __  | |_  _ __ ___    __ _ | |_   ___ | |__   
 `--. \ / __| / _ \| '_ \ | __|| '_ ` _ \  / _` || __| / __|| '_ \  
/\__/ /| (__ |  __/| | | || |_ | | | | | || (_| || |_ | (__ | | | | 
\____/  \___| \___||_| |_| \__||_| |_| |_| \__,_| \__| \___||_| |_| 
                                                                    
EOF
echo -e "${NC}"

echo -e "${PINK}<${NC}${PURPLE}Production environment is ready!${NC}${PINK}>${NC}"
echo -e "${PINK}<${NC}${PURPLE}Access the application at http://localhost:8000${NC}${PINK}>${NC}"
echo -e "${PINK}<${NC}${PURPLE}Also available at $BASE_URL${PINK}>${NC}"
echo -e "${PINK}<${NC}${PURPLE}To stop the application, run: docker compose down${NC}${PINK}>${NC}"
