#!/bin/bash

timestamp=$(date +%Y%m%d_%H%M%S)
log_file="server/logs/test_logs_$timestamp.log"
mkdir -p server/logs

echo "🧪 Starting test containers... logs will be saved to $log_file"

# Run the containers in the background
docker compose -f docker-compose.test.yml up --abort-on-container-exit --build > "$log_file" 2>&1 &
compose_pid=$!

# Spinner animation
spinner="⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏"
i=0
while kill -0 $compose_pid 2> /dev/null; do
  printf "\r⏳ Running tests... %s" "${spinner:i++%${#spinner}:1}"
  sleep 0.1
done

# Wait for the actual exit code
wait $compose_pid
exit_code=$?

# Clean up
docker compose -f docker-compose.test.yml down -v >> "$log_file" 2>&1

# Final message
echo -e "\n"
if [ $exit_code -eq 0 ]; then
    echo -e "\e[32m✅ TESTS PASSED — logs saved to $log_file\e[0m"
else
    echo -e "\e[31m❌ TESTS FAILED — check logs at $log_file\e[0m"
fi
