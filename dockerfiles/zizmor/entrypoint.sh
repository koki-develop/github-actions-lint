#!/bin/sh

if [ -n "${GITHUB_TOKEN}" ]; then
  export GH_TOKEN="${GITHUB_TOKEN}"
  export REVIEWDOG_GITHUB_TOKEN="${GITHUB_TOKEN}"
fi

if [ "${REVIEWDOG_ENABLED}" = 'true' ]; then
  /app/zizmor . \
    --persona="${ZIZMOR_PERSONA:-regular}" \
    --format=sarif \
    | reviewdog \
        -name=zizmor \
        -f=sarif \
        -reporter="${REVIEWDOG_REPORTER:-github-pr-review}" \
        -level=error \
        -filter-mode="${REVIEWDOG_FILTER_MODE:-added}" \
        -fail-level="${REVIEWDOG_FAIL_LEVEL:-any}"
else
  /app/zizmor . \
    --color=always \
    --persona="${ZIZMOR_PERSONA:-regular}"
fi
