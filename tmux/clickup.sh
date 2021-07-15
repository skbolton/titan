#/bin/sh

set -eu pipefail

TICKET=$(git branch --show-current | sed 's/\/.*//')
URL=https://app.clickup.com

xdg-open "${URL}/t/${TICKET}"
