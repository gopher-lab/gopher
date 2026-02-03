---
sidebar_position: 8
slug: /installation/cli/history
---

# history

View and manage backtest history and evolution sessions.

## Usage

```bash
gopher history [flags]
```

## Flags

| Flag | Description | Default |
|------|-------------|---------|
| `--session` | Filter by session ID | All sessions |
| `--symbol` | Filter by symbol (e.g., BTC) | All symbols |
| `--limit` | Number of results | `50` |
| `--grouped` | Group results by session | `false` |
| `--resumable` | Show only resumable sessions | `false` |
| `--json` | Output as JSON | `false` |
| `--db` | SQLite database path | `~/Documents/Gopher/gopher.db` |

## Subcommands

```bash
gopher history delete <id>    # Delete a backtest or session
```

## Examples

```bash
# List recent backtests
gopher history

# Group by session
gopher history --grouped

# Show resumable sessions
gopher history --resumable

# Filter by session
gopher history --session abc123 --json

# Delete a backtest
gopher history delete <backtest-id>
```
