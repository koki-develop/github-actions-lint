#!/bin/sh

if [ -n "${ZIZMOR_GITHUB_TOKEN}" ]; then
  export GH_TOKEN="${ZIZMOR_GITHUB_TOKEN}"
fi

/app/zizmor . \
  --color=always \
  --persona="${ZIZMOR_PERSONA:-regular}"
