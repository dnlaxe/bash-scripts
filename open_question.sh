#!/bin/bash

# Prompt for question number
read -p "Enter the question number (two digits, e.g., 07): " QUESTION_NUMBER

# Validate number format
if [[ ! "$QUESTION_NUMBER" =~ ^[0-9]{2}$ ]]; then
    echo "Error: Question number must be two digits (e.g., 07, 08)."
    exit 1
fi

# Prompt for question name
read -p "Enter the question name (e.g., tempConversion): " QUESTION_NAME

# Construct directory name
QUESTION_DIR="${QUESTION_NUMBER}_${QUESTION_NAME}"

# Navigate to directory
cd ~/repos/javascript-exercises/"$QUESTION_DIR" || { echo "Directory not found: $QUESTION_DIR"; exit 1; }

# Open the required files in VS Code
code README.md && code "$QUESTION_NAME".js && code "$QUESTION_NAME".spec.js
