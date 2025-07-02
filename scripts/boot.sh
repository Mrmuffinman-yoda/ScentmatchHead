#!/bin/bash
# filepath: /home/haris/code/ScentmatchHead/run.sh


PURPLE='\033[1;35m'
PINK='\e[38;5;212m'
NC='\033[0m'
WORK_DIR="$(pwd)"
echo "Working directory: $WORK_DIR"


echo -e "${PINK}<${NC}${PURPLE}Initialising Scentmatch environment...${NC}${PINK}>${NC}"

# Function to clone a repository
clone_repo() {
    local repo_url="$1"
    local target_dir="$2"
    
    echo "Cloning $repo_url into $target_dir..."
    
    if [ -d "$target_dir" ]; then
        echo "Directory $target_dir already exists. Skipping..."
    else
        git clone "$repo_url" "$target_dir"
        if [ $? -eq 0 ]; then
            echo "Successfully cloned $repo_url"
        else
            echo "Failed to clone $repo_url"
            return 1
        fi
    fi
    
    return 0
}

# Main execution
echo -e "${PINK}<${NC}${PURPLE}Starting git clone operations...${NC}${PINK}>${NC}"

# Clone the server repository
clone_repo "https://github.com/Mrmuffinman-yoda/ScentMatchServer" "./server"

# Clone the UI repository
clone_repo "https://github.com/Mrmuffinman-yoda/ScentMatch" "./ui"

echo "Completed all clone operations"

echo -e "${PINK}<${NC}${PURPLE}Initialising environment variables...${NC}${PINK}>${NC}"

python3 config/env/start.py
if [ $? -eq 0 ]; then
    echo "Environment variables initialized successfully"
else
    echo "Failed to initialize environment variables"
    exit 1
fi


echo -e "${PINK}<${NC}${PURPLE}Installing dependencies for the UI...${NC}${PINK}>${NC}"

cd ./ui
pnpm install

if [ $? -eq 0 ]; then
    echo "UI dependencies installed successfully"
else
    echo "Failed to install UI dependencies"
    exit 1
fi

echo "👷‍♂️Your ScentMatch  environment is ready to use! "
