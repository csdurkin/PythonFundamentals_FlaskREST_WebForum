#!/bin/sh

# set -e: exit immediately if newman complains
# "Exit on Error" Mode: If any command returns a non-zero exit status, script terminates, and  error sent to calling process
set -e

#This line ensures that the script will automatically terminate any background processes it started when it exits.
trap 'kill $PID' EXIT # kill the server on exit

#This line runs the "run.sh" script in the background by appending the "&" symbol at the end.
./run.sh &

#This line of code assigns the Process ID (PID) of the most recently executed background process to the variable "PID." 
PID=$! # record the PID

#Executes Newman (a Postman command-line tool) to run a collection of API tests from "forum_multiple_posts.postman_collection.json" using the environment file "env.json."
newman run forum_multiple_posts.postman_collection.json -e env.json # use the env file

#Runs Newman to execute the API tests defined in "forum_post_read_delete.postman_collection.json" with 50 iterations per test.
newman run forum_post_read_delete.postman_collection.json -n 50 # 50 iterations
