#!/bin/bash

printf "Current Tags: `tmsu tags $1`\n"
printf "New Tags: "
read -r tags
tmsu tag "$1" $tags
