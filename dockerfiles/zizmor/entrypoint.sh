#!/bin/sh

/app/zizmor . \
  --color=always \
  --gh-token="${GH_TOKEN}" \
  --persona="${ZIZMOR_PERSONA:-regular}"
