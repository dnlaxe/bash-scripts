#!/bin/bash

# Navigate to Exercism workspace
cd ~/exercism || exit

# Ask the user for the exercise name (without dashes)
read -p "Enter the name of the exercise (e.g., 'reverse string'): " exercise_name

# Convert spaces to dashes
formatted_name=$(echo "$exercise_name" | tr '[:upper:]' '[:lower:]' | tr -d "'" | tr ' ' '-')

# Download the exercise from Exercism
exercism download --track=javascript --exercise="$formatted_name"

# Check if the download was successful
if [ $? -ne 0 ]; then
    echo "Error downloading '$formatted_name'. Please check the name and try again."
    exit 1
fi

echo "Exercise '$formatted_name' downloaded successfully."

# Add changes to Git
git add .
git commit -m "Add Exercism solution for: $formatted_name"

# Push to GitHub
git push origin main  # Change 'main' to 'master' if needed

echo "Exercise '$formatted_name' uploaded to GitHub successfully!"
