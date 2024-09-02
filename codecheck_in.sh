#!/bin/bash

# Update your Github Organization Name
ORGANIZATION="XYZ"

# Your personal access token
TOKEN="XYZ"

# Array of repository names

REPOSITORIES=("Repo-1" "Repo-2" "Repo-3" "......")

# Directory to clone repositories (temporary)
WORKDIR="/tmp/commit_log_Organization_Name"

# Make sure the working directory exists
mkdir -p "$WORKDIR"

# Loop through each repository
for REPO in "${REPOSITORIES[@]}"; do
    echo "Processing repository: $REPO"

    # Clone the repository using the token
    git clone "https://$TOKEN@github.com/$ORGANIZATION/$REPO.git" "$WORKDIR/$REPO"

    # Check if the repository was cloned successfully
    if [ $? -ne 0 ]; then
        echo "Failed to clone repository: $REPO"
        continue
    fi

    # Navigate into the repository
    cd "$WORKDIR/$REPO" || exit

    # Get a list of all branches
    BRANCHES=$(git branch -r | grep -v '\->' | sed 's/origin\///')

    # Loop through each branch
    for BRANCH in $BRANCHES; do
        echo "Branch: $BRANCH"

        # Check out the branch
        git checkout "$BRANCH" > /dev/null 2>&1

        # Define the commit log file
        COMMIT_FILE="$WORKDIR/${REPO}_${BRANCH}_commits.txt"

        # Get commit history for below Date 
        git log --since="2024-08-30 00:00" --until="2024-09-01 00:00" --pretty=format:"%h - %an, %ar : %s" > "$COMMIT_FILE"

        # Check if the commit log file is empty
        if [ ! -s "$COMMIT_FILE" ]; then
            echo "No commits found for branch $BRANCH on  August 2024. Removing empty file."
            rm -f "$COMMIT_FILE"
        else
            echo "Commit history for branch $BRANCH saved to $COMMIT_FILE"
        fi
    done

    # Go back to the working directory
    cd "$WORKDIR" || exit

    # Optionally, remove the cloned repository to save space
    rm -rf "$WORKDIR/$REPO"
done

echo "All repositories processed."

