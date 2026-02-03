---
sidebar_position: 9
slug: /installation/cli/coverage
---

# coverage

Check data coverage and warmup status for an asset before running backtests.

## Usage

```bash
gopher coverage --asset <ASSET> [flags]
```

## Flags

| Flag | Description | Default |
|------|-------------|---------|
| `--asset` | Trading asset (e.g., BTC, ETH) | Required |
| `--start` | Start date (YYYY-MM-DD) | 7 days ago |
| `--end` | End date (YYYY-MM-DD) | Today |
| `--intervals` | Candle intervals to check | `15m,1h,4h` |
| `--optimal` | Find optimal date range | `false` |
| `--json` | Output as JSON | `false` |
| `--api-key` | API key for data service | Usually not required |

## Examples

```bash
# Check coverage for BTC
gopher coverage --asset BTC

# Check specific date range
gopher coverage --asset ETH --start 2025-01-01 --end 2025-01-25

# Find optimal date range with sufficient coverage
gopher coverage --asset BTC --optimal

# Check specific intervals
gopher coverage --asset SOL --intervals 1h,4h --json
```
