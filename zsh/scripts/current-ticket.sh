#!/bin/sh

set -eu pipefail

STARTED_TASK=$(task +ACTIVE limit:1 uuids)
if [[ -z $STARTED_TASK ]]; then
  exit 0
fi

TICKET=$(task _get $STARTED_TASK.ticket)
if [[ -z $TICKET ]]; then
  exit 0
fi

zk edit $TICKET
