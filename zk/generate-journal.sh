#!/bin/sh

# Generates my digital planner system for a given year
#
# Yearly file [year].md
# Monthly File [year]-[month].md
# Weekly File [year]-w[week].md
# daily File [year]-[month]-[day].md
#
# Usage generate-journal 2022

# First Generate year file
year=$1
zk new --no-input --group yearly -p --extra date="$year" Quests

for time in $(generate-yearly-dates.sh $1); do
  # generate monthly files
  month=$(date +%m --date="$time")
  week=$(date +%U --date="$time")
  zk new --no-input --group month -p --extra date=$(date +%Y-%m --date="$time"),year="$year" --title="Month $month, $year" Quests
  # create weekly files
  zk new --no-input --group week -p --extra date="$(date +%Y-W%U --date="$time")",month="$month",year="$year" --title="Week $week, $year" Quests
  # create daily files
  yesterday=$(date +%Y-%m-%d --date="$time - 1 day")
  tomorrow=$(date +%Y-%m-%d --date="$time + 1 day")
  zk new --no-input --group quest -p --extra date="$time",prev="$yesterday",next="$tomorrow",year="$year",week="$week" Quests
done

