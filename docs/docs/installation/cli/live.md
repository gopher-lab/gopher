---
sidebar_position: 6
slug: /installation/cli/live
---

# live

Start live trading on Hyperliquid.

## Usage

```bash
gopher live [flags]
```

## Flags

| Flag | Description | Default |
|------|-------------|---------|
| `--config` | Path to `traders.yaml` config | `traders.yaml` |
| `--mode` | Trading mode (`paper` or `live`) | `paper` |
| `--strategy` | Strategy prompt (overrides config, disables orchestrator) | - |
| `--orchestrator` | Use LLM for dynamic strategy selection | `false` |
| `--llm-api-key` | LLM API key (OpenRouter or Gopher Key) | Env |
| `--llm-base-url` | LLM API base URL | OpenRouter |
| `--db` | SQLite database path | `gopher.db` |

## Examples

```bash
# Paper trading (testnet)
gopher live --config traders.yaml --mode paper

# Live trading (mainnet - real funds!)
gopher live --config traders.yaml --mode live

# LLM orchestrator for strategy selection
gopher live --config traders.yaml --orchestrator --db gopher.db

# Manual strategy prompt
gopher live --mode paper --strategy "Follow momentum breakouts"
```
