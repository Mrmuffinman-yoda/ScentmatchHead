#!/bin/sh

# Configure MinIO client
mc alias set myminio http://localhost:9000 minio minio123

# Create the "scentmatch" bucket
mc mb myminio/scentmatch

# Allow anonymous (public) read access to the "scentmatch" bucket
mc anonymous set download myminio/scentmatch

# Upload all files from the "blob_storage" folder to the "scentmatch" bucket
mc cp --recursive /blob_storage/ myminio/scentmatch/