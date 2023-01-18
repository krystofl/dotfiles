#!/usr/bin/env bash

# Utility functions for bash scripts

# =============================================================================
# COLOR CODES
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# =============================================================================
# log an ERROR message
log_error () {
    echo -e "${RED}ERROR $1${NC}"
}

# =============================================================================
# log a success message in green
log_success () {
    echo -e "${GREEN}$1${NC}"
}

# =============================================================================
# log an info message
log_info () {
    echo -e "$1"
}
