#!/bin/bash

# Color codes
PURPLE='\033[1;35m'
PINK='\e[38;5;212m'
NC='\033[0m'


echo -e "${PINK}<${NC}${PURPLE}Cleaning Project${NC}${PINK}>${NC}"

echo "Cleaning frontend build artifacts..."
cd ui
rm -rf node_modules package-lock.json .next
cd ..

echo -e "${PINK}<${NC}${PURPLE}Cleaning Python __pycache__ files...${NC}${PINK}>${NC}"
cd server/app
find . -type d -name "__pycache__" -exec rm -rf {} +
cd ../../

echo -e "${PINK}<${NC}${PURPLE}Removing Docker volumes related to this project${NC}${PINK}>${NC}"

echo ""
docker volume rm $(docker volume ls -q | grep 'scentmatch') 2>/dev/null

echo "Removing Docker images related to this project"
docker images | grep scentmatch
# Delete all images related to scentmatch without asking
images_to_delete=$(docker images -q | grep -v '<none>' | xargs docker inspect --format '{{.RepoTags}} {{.RepoDigests}} {{.RepoTags}}' | grep 'scentmatch' | awk '{print $1}')
if [[ -n "$images_to_delete" ]]; then
  docker rmi $images_to_delete
fi

echo "Cleanup complete."
