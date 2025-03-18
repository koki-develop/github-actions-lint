#!/bin/sh

set -euo pipefail

echo "::group::ghalint"
trap 'echo "::endgroup::"' EXIT

ghalint run
ghalint run-action $@
