#!/bin/sh

# Loops through and generates a timestamp for every day in a year

# Usage: generate-dates 2022
#        2022-01-01
#        2022-01-02
#        ...etc

start_year="$1"
day="$start_year-01-01"
until [[ $day > $start_year-12-31 ]]; do
  echo $day
  day=$(date -I -d "$day + 1 day")
done
