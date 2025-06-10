#!/bin/sh

# Start the MinIO server in the background
minio server /data --console-address ":9090" &

# Wait for the MinIO server to start
sleep 5

# Configure MinIO client using environment variables
mc alias set myminio http://localhost:9000 "$MINIO_ROOT_USER" "$MINIO_ROOT_PASSWORD"

# Create the "scentmatch" bucket
mc mb myminio/scentmatch

# Allow anonymous (public) read access to the "scentmatch" bucket
mc anonymous set download myminio/scentmatch

# Upload all files from the "blob_storage" folder to the "scentmatch" bucket
mc cp --recursive /blob_storage/ myminio/scentmatch/

wait