#!/bin/bash

# Check if the user has provided the name of the application as an argument
if [ -z "$1" ]; then
    echo "Please provide the name of the application as an argument."
    exit 1
fi

# Use the pgrep command to find the PID of the running application
pid=$(pgrep "$1")

# If the application is not running, exit the script
if [ -z "$pid" ]; then
    echo "The application is not running."
    exit 1
fi

# Loop through the pid array and run the command "sudo netstat -tulnep | grep $p"
for p in $pid; do
    if sudo netstat -tulnep | grep $p; then
        # If the output of the command is non-empty, store the value of p in a variable and break the loop
        found_pid=$p
        echo "pid found"
        break
    fi
done

# If no running process was found, exit the script
if [ -z "$found_pid" ]; then
    echo "No running process found for $1."
    exit 1
fi

echo "$found_pid"

exit 0

