#!/bin/bash
echo "== List objects"

if [ -z "$1" ]; then
    echo "Error: Please provide a bucket name."
    exit 1
fi

input_available="$1"  # Remove spaces around "="

# Create the bucket with explicit region (replace "us-east-1" with your region)
aws s3api list-objects-v2 \
--bucket "$input_available"