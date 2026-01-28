#!/bin/bash
# Gopher Quick Start - TAO Strategy Evolution
# A tested configuration to get started with strategy evolution
#
# Prerequisites:
#   1. Install gopher CLI (see docs/installation/cli.md)
#   2. Set your API key: export BART_GOPHER_CODE='gopher_your-key-here'
#      Or use OpenRouter: export OPENROUTER_API_KEY='sk-or-v1-your-key-here'
#
# Usage:
#   chmod +x quickstart-tao.sh
#   ./quickstart-tao.sh

set -e

# Check if gopher is installed
if ! command -v gopher &> /dev/null; then
    echo "Error: gopher CLI not found. Please install it first."
    echo "See: https://github.com/gopher-lab/gopher/releases"
    exit 1
fi

# Check for API key
if [ -z "$BART_GOPHER_CODE" ] && [ -z "$OPENROUTER_API_KEY" ]; then
    echo "Warning: No API key found."
    echo "Set BART_GOPHER_CODE or OPENROUTER_API_KEY environment variable."
    echo ""
fi

# Calculate date range (last 25 days)
# macOS uses -v flag, Linux uses -d flag
END_DATE=$(date +%Y-%m-%d)
START_DATE=$(date -v-25d +%Y-%m-%d 2>/dev/null || date -d "25 days ago" +%Y-%m-%d)

echo "=============================================="
echo "  Gopher Quick Start - TAO Strategy Evolution"
echo "=============================================="
echo ""
echo "Configuration:"
echo "  Asset:      TAO"
echo "  Date range: $START_DATE to $END_DATE"
echo "  Intervals:  15m, 30m, 1h"
echo "  Iterations: 50"
echo "  Leverage:   10x"
echo ""
echo "Starting evolution..."
echo ""

gopher evolve \
  --asset TAO \
  --start "$START_DATE" \
  --end "$END_DATE" \
  --intervals 15m,30m,1h \
  --iterations 50 \
  --leverage 10 \
  --model qwen/qwen3-max \
  --backtest-model qwen/qwen3-vl-8b-instruct
