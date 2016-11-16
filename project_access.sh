#!/bin/bash -
#===============================================================================
# Get a list of all users in all Google Cloud Projects.
#===============================================================================
#
# Check to see if output.txt exists then ask to overwrite it
export PROJECTS=$(gcloud projects list | awk 'NR>1 {print $1}')
echo "IAM LIST" > output.txt
while read -r line; do
    echo "================ $line ==============" >> output.txt
    gcloud projects get-iam-policy $line >> output.txt
done <<< "$PROJECTS"
