#!/bin/bash
# Utilities for both OSX and Docker Linux
# Python should be on the PATH

# Only source common_utils once
if [ -n "$COMMON_UTILS_SOURCED" ]; then
    return
fi
COMMON_UTILS_SOURCED=1

# Turn on exit-if-error
set -e

MULTIBUILD_DIR=$(dirname "${BASH_SOURCE[0]}")
if [ $(uname) == "Darwin" ]; then IS_OSX=1; fi

# Work round bug in travis xcode image described at
# https://github.com/direnv/direnv/issues/210
shell_session_update() { :; }

if [ -n "$MB_KEEP_ALIVE" ]; then
    # Start a process that runs as a keep-alive
    # to avoid travis quitting if there is no output

    (while true; do >&2 echo "Travis-CI keep-alive"; sleep 480; done) &
fi
