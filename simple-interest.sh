#!/usr/bin/env bash

set -euo pipefail

echo "Simple Interest Calculator"

read -rp "Enter principal (P): " principal
read -rp "Enter rate of interest (R) in %: " rate
read -rp "Enter time period (T) in years: " time

# Basic numeric validation (allows integers or decimals)
num_regex='^([0-9]+([.][0-9]+)?)$'

if [[ ! $principal =~ $num_regex ]]; then
  echo "Error: principal must be a non-negative number." >&2
  exit 1
fi

if [[ ! $rate =~ $num_regex ]]; then
  echo "Error: rate must be a non-negative number." >&2
  exit 1
fi

if [[ ! $time =~ $num_regex ]]; then
  echo "Error: time must be a non-negative number." >&2
  exit 1
fi

# SI = (P * R * T) / 100
interest=$(awk -v p="$principal" -v r="$rate" -v t="$time" 'BEGIN { printf "%.2f", (p*r*t)/100 }')

echo "Simple Interest = $interest"