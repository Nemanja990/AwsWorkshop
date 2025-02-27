#! /bin/bash
echo "== Put objects"

OUTPUT_DIR="tmp/s3-bash-scripts"

mkdir -p $OUTPUT_DIR

NUM_FILES=$((RANDOM % 6 + 5))

for i in $(seq 1 $NUM_FILES); do
    # Generate random filename with timestamp and random string
    filename="file_$(date +%s)_${i}_$(openssl rand -hex 3).txt"
    
    # Create file with random content (100KB-1MB in size)
    dd if=/dev/urandom of="$filename" bs=1024 count=$((100 + RANDOM % 901)) 2>/dev/null
    
    echo "Created file: $filename (size: $(du -h "$filename" | cut -f1))"
done