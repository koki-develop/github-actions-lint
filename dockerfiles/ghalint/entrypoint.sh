#!/bin/sh

set -euo pipefail

ghalint run
ghalint run-action $@
