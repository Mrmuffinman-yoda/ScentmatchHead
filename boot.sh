#!/bin/bash
# filepath: /home/haris/code/ScentmatchHead/run.sh
WORK_DIR="$(pwd)"
echo "Working directory: $WORK_DIR"

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
echo "Starting git clone operations..."

# Clone the server repository
clone_repo "https://github.com/Mrmuffinman-yoda/ScentMatchServer" "./server"

# Clone the UI repository
clone_repo "https://github.com/Mrmuffinman-yoda/ScentMatch" "./ui"

echo "Completed all clone operations"

echo "Initialising environment variables..."
python3 config/env/start.py
if [ $? -eq 0 ]; then
    echo "Environment variables initialized successfully"
else
    echo "Failed to initialize environment variables"
    exit 1
fi

echo "Installing pnpm..."
npm install -g pnpm

if [ $? -eq 0 ]; then
    echo "pnpm installed successfully"
else
    echo "Failed to install pnpm"
    exit 1
fi

echo "Installing dependencies for the UI..."
cd ./ui
pnpm install

if [ $? -eq 0 ]; then
    echo "UI dependencies installed successfully"
else
    echo "Failed to install UI dependencies"
    exit 1
fi

echo "Your ScentMatch environment is ready to use!"