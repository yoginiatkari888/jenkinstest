#!/bin/bash

# Remote server details
remote_user="root"
remote_host="192.168.51.99"
remote_folder="/root/yogii"

# Local folder
local_folder="/root/yogii_backup"

# Use diff to find differences
diff_output=$(ssh "${remote_user}@${remote_host}" "diff --exclude-from=/home/yogini/Downloads/jenkins/jenkinstest/backup/ -rqb '${remote_folder}/' '${local_folder}/'")

# Check the output of diff
if [ -z "$diff_output" ]; then
    echo "No differences found."
else
    echo "Differences found. Here is the diff output:"
    echo "$diff_output"
fi
