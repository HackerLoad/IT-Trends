#!/bin/bash
LOCAL_DIR="/pfad/zum/ordner"
BUCKET_NAME="s3://mein-bucket-name"

aws s3 sync "$LOCAL_DIR" "$BUCKET_NAME"