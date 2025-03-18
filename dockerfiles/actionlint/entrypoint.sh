#!/bin/sh

set -euo pipefail

echo "::group::actionlint"
trap 'echo "::endgroup::"' EXIT

actionlint -color -verbose
