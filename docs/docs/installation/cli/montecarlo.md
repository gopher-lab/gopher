---
sidebar_position: 4
---

# montecarlo

Run Monte Carlo validation to statistically validate a trading strategy.

Alias: `gopher mc`

## Usage

```bash
gopher montecarlo --asset <ASSET> --prompt <STRATEGY> [flags]
```

## Flags

| Flag | Description | Default |
|------|-------------|---------|
| `--asset` | Trading asset (e.g., BTC, ETH) | Required |
| `--prompt` | Strategy prompt | Required |
| `--runs` | Number of Monte Carlo runs (10-500) | `100` |
| `--start` | Start date (YYYY-MM-DD) | 7 days ago |
| `--start-date` | Alias for `--start` | - |
| `--end` | End date (YYYY-MM-DD) | Today |
| `--end-date` | Alias for `--end` | - |
| `--intervals` | Candle intervals | `15m,1h,4h` |
| `--eval-interval` | Evaluation interval for decisions | First interval |
| `--indicators` | Indicator config file (JSON or YAML) | - |
| `--db` | SQLite database path | `~/Documents/Gopher/gopher.db` |
| `--sessions-dir` | Output directory for results | `~/Documents/Gopher/sessions` |
| `--api-key` | LLM API key (OpenRouter or Gopher Key) | Env |
| `--llm-api-key` | Alias for `--api-key` | - |
| `--base-url` | LLM API base URL | OpenRouter |
| `--llm-base-url` | Alias for `--base-url` | - |
| `--loop-model` | Override loop model ID | - |
| `--model` | LLM model for decisions | `qwen/qwen3-vl-8b-instruct` |
| `--backtest-model` | Alias for `--model` | - |
| `--json` | Output results as JSON | `false` |

## Examples

```bash
# Basic Monte Carlo validation
gopher montecarlo --asset BTC --prompt "Follow momentum breakouts" --runs 50

# Fast run using 8h intervals and eval cadence
gopher montecarlo --asset TAO --prompt "Simple momentum" --runs 10 \
  --start 2025-01-01 --end 2025-01-03 \
  --intervals 8h --eval-interval 8h

# JSON output
gopher mc --asset ETH --prompt "Mean reversion with Bollinger Bands" --runs 100 --json
```
