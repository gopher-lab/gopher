---
sidebar_position: 3
slug: /installation/cli/backtest
---

# backtest

Run a single backtest simulation for a strategy prompt.

## Usage

```bash
gopher backtest --asset <ASSET> --prompt <STRATEGY> [flags]
```

## Flags

| Flag | Description | Default |
|------|-------------|---------|
| `--asset` | Trading asset (e.g., BTC, ETH) | Required |
| `--prompt` | Strategy prompt | Required |
| `--start` | Start date (YYYY-MM-DD) | 7 days ago |
| `--start-date` | Alias for `--start` | - |
| `--end` | End date (YYYY-MM-DD) | Today |
| `--end-date` | Alias for `--end` | - |
| `--intervals` | Candle intervals | `15m,1h,4h` |
| `--eval-interval` | Evaluation interval for decisions | First interval |
| `--leverage` | Trading leverage | `10` |
| `--indicators` | Indicator config file (JSON or YAML) | - |
| `--db` | SQLite database path | `~/Documents/Gopher/gopher.db` |
| `--output` | Output directory for results | `~/Documents/Gopher/sessions` |
| `--sessions-dir` | Alias for `--output` | - |
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
# Basic backtest
gopher backtest \
  --asset BTC \
  --prompt "Follow momentum breakouts with RSI confirmation" \
  --start 2025-01-01 \
  --end 2025-01-25 \
  --intervals 15m,1h,4h

# Fast run using 8h intervals and eval cadence
gopher backtest \
  --asset TAO \
  --prompt "Simple momentum" \
  --start 2025-01-01 \
  --end 2025-01-03 \
  --intervals 8h \
  --eval-interval 8h

# Indicator overrides (JSON or YAML)
gopher backtest --asset BTC --prompt "RSI + MACD" \
  --indicators ./indicators.yaml
```
