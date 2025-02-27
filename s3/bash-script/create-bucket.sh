#!/bin/bash
echo "== Create bucket"

if [ -z "$1" ]; then
    echo "Error: Please provide a bucket name."
    exit 1
fi

input_available="$1"  # Remove spaces around "="

# Create the bucket with explicit region (replace "us-east-1" with your region)
aws s3api create-bucket \
--bucket "$input_available" \
--create-bucket-configuration="LocationConstraint=eu-central-1" \
--query Location \
--output text