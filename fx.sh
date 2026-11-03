#!/bin/bash

# Load shared helper functions
source "$(dirname "$0")/lib.sh"

# Check that exactly three arguments are provided
if [ "$#" -ne 3 ]; then
    die "Usage: ./fx.sh AMOUNT FROM TO" 2
fi

# Store the arguments in variables
amount="$1"
from="${2^^}"
to="${3^^}"

# Validate the amount
if ! [[ "$amount" =~ ^[0-9]+([.][0-9]+)?$ ]] || ! awk -v amount="$amount" 'BEGIN { exit !(amount > 0) }'; then
    die "Amount must be a positive number." 2
fi

# Validate currency codes
if ! [[ "$from" =~ ^[A-Z]{3}$ ]]; then
    die "Source currency must contain exactly 3 letters." 2
fi

if ! [[ "$to" =~ ^[A-Z]{3}$ ]]; then
    die "Target currency must contain exactly 3 letters." 2
fi


# Build the exchange rate API URL
url="https://open.er-api.com/v6/latest/$from"

# Fetch exchange rate data
response=$(fetch "$url") || exit 1

# Check whether the API request was successful
result=$(echo "$response" | jq -r '.result')

if [ "$result" != "success" ]; then
    die "Exchange rate API request was unsuccessful." 1
fi


# Extract the target currency rate
rate=$(echo "$response" | jq -r --arg target "$to" '.rates[$target] // empty')

# Check whether the target currency exists
if [ -z "$rate" ] || [ "$rate" = "null" ]; then
    die "Currency $to is not supported." 2
fi


# Calculate the converted amount
converted=$(awk -v amount="$amount" -v rate="$rate" 'BEGIN { printf "%.2f", amount * rate }')

# Display the conversion
echo "$amount $from = $converted $to"
echo "Exchange rate: 1 $from = $rate $to"
