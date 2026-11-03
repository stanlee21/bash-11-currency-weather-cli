#!/bin/bash

# Display an error message and exit
die() {
    echo "Error: $1" >&2
    exit "${2:-1}"
}

# Make an HTTP request using curl
fetch() {
    curl -fsS --max-time 10 "$1" || die "Unable to connect to the API. Check your internet connection." 1
}
