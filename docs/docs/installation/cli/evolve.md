---
sidebar_position: 5
slug: /installation/cli/evolve
---

# evolve

Run autonomous strategy evolution that iteratively generates, backtests, and refines strategies.

Alias: `gopher evolution`

## Usage

```bash
gopher evolve --asset <ASSET> [flags]
```

## Flags

| Flag | Description | Default |
|------|-------------|---------|
| `--asset` | Trading asset (e.g., BTC, ETH) | Required unless `--resume` |
| `--start` | Start date (YYYY-MM-DD) | 7 days ago |
| `--start-date` | Alias for `--start` | - |
| `--end` | End date (YYYY-MM-DD) | Today |
| `--end-date` | Alias for `--end` | - |
| `--intervals` | Candle intervals | `15m,1h,4h` |
| `--eval-interval` | Evaluation interval for decisions | First interval |
| `--prompt` | Strategy guidance prompt | - |
| `--iterations` | Maximum iterations (1-200) | `50` |
| `--max-iterations` | Alias for `--iterations` | - |
| `--montecarlo-runs` | Monte Carlo runs per iteration | - |
| `--min-coverage` | Minimum data coverage percent | - |
| `--indicators` | Indicator config file (JSON or YAML) | - |
| `--risk-percent` | Risk percent per trade | - |
| `--stop-percent` | Stop loss percent | - |
| `--target-rr` | Target reward-to-risk | - |
| `--min-rr` | Minimum reward-to-risk | - |
| `--max-margin-percent` | Max margin percent | - |
| `--leverage` | Trading leverage | `10` |
| `--initial-balance` | Initial balance | - |
| `--model` | LLM model for strategy evolution | `qwen/qwen3-max` |
| `--loop-model` | Alias for `--model` | - |
| `--backtest-model` | LLM model for backtest decisions | `qwen/qwen3-vl-8b-instruct` |
| `--api-key` | LLM API key (OpenRouter or Gopher Key) | Env |
| `--llm-api-key` | Alias for `--api-key` | - |
| `--base-url` | LLM API base URL | OpenRouter |
| `--llm-base-url` | Alias for `--base-url` | - |
| `--db` | SQLite database path | `~/Documents/Gopher/gopher.db` |
| `--output` | Output directory for sessions | `~/Documents/Gopher/sessions` |
| `--sessions-dir` | Alias for `--output` | - |
| `--resume` | Resume a previous session (path to `.session.json`) | - |
| `--json` | Output final results as JSON | `false` |

## Examples

```bash
# Basic evolution
gopher evolve --asset BTC --start 2025-01-01 --end 2025-01-25

# Fast run using 8h intervals and eval cadence
gopher evolve --asset TAO --iterations 1 --montecarlo-runs 10 \
  --start 2025-01-01 --end 2025-01-03 \
  --intervals 8h --eval-interval 8h

# Resume an interrupted session
gopher evolve --resume ~/Documents/Gopher/sessions/agent_20250127_143052.session.json
```
