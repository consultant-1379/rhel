#!/bin/bash
# Helper functions.

# Some colors.
RED="\033[1;31m"
GREEN="\033[1;32m"
DEFAULT="\033[0m"
alias reset_term="tput sgr0"

# Colorized echo.
cecho () {
    local msg=$1
    col=$2
    echo -e "$col$msg$DEFAULT"
    # reset_term
}
