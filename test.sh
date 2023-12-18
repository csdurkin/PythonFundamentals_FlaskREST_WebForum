#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# The trap command will execute the 'kill $PID' command when the script exits.
trap 'kill $PID' EXIT # Kill the server on exit

# Start your Flask application using your script (e.g., run.sh) in the background.
./run.sh &

# Record the Process ID (PID) of the Flask application.
PID=$! # Record the PID

# Use Newman (a Postman command-line tool) to run API tests from "cdurkin_cs515_project3_collection.postman_collection.json."
# The '-e' flag specifies the environment file to use.
newman run cdurkin_cs515_project3_collection.postman_collection.json -e cdurkin_project3_enviroment.postman_environment.json

# Run Newman to execute the API tests defined in "forum_post_read_delete.postman_collection.json" with 50 iterations per test.
# The '-n' flag specifies the number of iterations.
newman run forum_post_read_delete.postman_collection.json -n 50 # 50 iterations
