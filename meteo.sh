#!/bin/bash

# Load shared helper functions
source "$(dirname "$0")/lib.sh"

# Get the city from the argument or use the default
city="${1:-${METEO_CITY:-Yaounde}}"

# Replace spaces in the city name with +
city_url="${city// /+}"

# Build the weather API URL
url="https://wttr.in/${city_url}?format=j1"

# Fetch weather data
response=$(fetch "$url")

# Extract current weather information
weather=$(echo "$response" | jq -r '
    .current_condition[0] |
    {
        temperature: .temp_C,
        humidity: .humidity,
        description: .weatherDesc[0].value
    }
')

# Display weather information
echo "Weather Report: $city"
echo "Temperature: $(echo "$weather" | jq -r '.temperature')°C"
echo "Description: $(echo "$weather" | jq -r '.description')"
echo "Humidity: $(echo "$weather" | jq -r '.humidity')%"
