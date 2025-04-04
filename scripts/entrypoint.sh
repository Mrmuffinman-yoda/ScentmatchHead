#!/bin/sh

# Start the MinIO server in the background
minio server /data --console-address ":9090" &

# Wait for the MinIO server to start
sleep 5

# Run the initialization script
if [ -f /scripts/init.sh ]; then
    sh /scripts/init.sh
fi

# Keep the container running
wait