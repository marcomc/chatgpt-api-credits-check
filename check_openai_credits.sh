#!/usr/bin/env bash

# File: check_openai_credits.sh

# Prompt to open the OpenAI login page
echo "Opening OpenAI login page in your browser..."
if [[ "${OSTYPE}" == "linux-gnu"* ]]; then
  xdg-open "https://platform.openai.com/login"
elif [[ "${OSTYPE}" == "darwin"* ]]; then
  open "https://platform.openai.com/login"
else
  echo "Unsupported OS. Please open https://platform.openai.com/login manually."
fi

# Prompt the user to enter the session key
read -r -p "Please log in to OpenAI and copy your session key. Then paste it here: " SESSION_KEY

# Check if the session key is set
if [[ -z "${SESSION_KEY}" ]]; then
  echo "Error: Session key is not set."
  exit 1
fi

# Make a request to the OpenAI API to get billing information
response=$(curl -s -H "Authorization: Bearer ${SESSION_KEY}" \
  "https://api.openai.com/v1/dashboard/billing/credit_grants")

# Debug: Print the raw API response
echo "API Response: ${response}"

# Parse the response to extract credits and expiration dates
total_credits=$(echo "${response}" | jq '.total_credits // 0')
used_credits=$(echo "${response}" | jq '.used_credits // 0')
expiration_date=$(echo "${response}" | jq '.expiration_date // "unknown"')

# Calculate remaining credits only if total_credits and used_credits are numbers
if [[ "${total_credits}" =~ ^[0-9]+$ ]] && [[ "${used_credits}" =~ ^[0-9]+$ ]]; then
  remaining_credits=$((total_credits - used_credits))
else
  remaining_credits="unknown"
fi

# Display the credits and expiration date
echo "Credits: ${remaining_credits}/${total_credits}"
echo "Expiration Date: ${expiration_date}"