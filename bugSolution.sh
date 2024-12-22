#!/bin/bash

# This script demonstrates a corrected version with synchronization.

count=0

# Mutex to protect the counter
declare -i mutex=0

# Function to increment the counter
increment_count() {
  while ((mutex)); do
    sleep 0.001
  done
  mutex=1
  local temp=$((count + 1))
  count=$temp
  mutex=0
}

# Function to print the counter value
print_count() {
  echo "Counter: $count"
}

# Create two threads
thread1(){ 
  for i in {1..10000}; do
    increment_count
  done
}
thread2(){ 
  for i in {1..10000}; do
    increment_count
  done
}

# Start the threads
thread1 &
thread2 &

# Wait for both threads to complete
wait

# Print the final counter value
print_count