#!/bin/bash

# Start ninja.py in the background
python3 ninja.py &
NINJA_PID=$!  # Get the process ID of ninja.py

echo "✅ ninja.py is running..."

# Periodically print output to keep Scrutinizer active
while kill -0 $NINJA_PID 2>/dev/null; do  # Check if the process is still running
    echo "[$(date +'%T')] ninja.py is still running..."
    sleep 60  # Print every 60 seconds
done

# Log the exit status of ninja.py
echo "ninja.py exited with status $?"
