#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
# This ensures that any errors during script execution will cause it to terminate immediately.
set -e

# Define a trap to ensure that the Flask application is stopped when the script exits.
# The trap command will execute the 'kill $PID' command when the script exits.
trap 'kill $PID' EXIT # Kill the server on exit

# Start your Flask application using your script (e.g., run.sh) in the background.
# The '&' symbol runs the script in the background.
./run.sh &

# Record the Process ID (PID) of the Flask application.
# This allows us to track the background process.
PID=$! # Record the PID

# Use Newman (a Postman command-line tool) to run API tests from "forum_multiple_posts.postman_collection.json."
# The '-e' flag specifies the environment file to use.
newman run forum_multiple_posts.postman_collection.json -e env.json # Use the env file

# Run Newman to execute the API tests defined in "forum_post_read_delete.postman_collection.json" with 50 iterations per test.
# The '-n' flag specifies the number of iterations.
newman run forum_post_read_delete.postman_collection.json -n 50 # 50 iterations
