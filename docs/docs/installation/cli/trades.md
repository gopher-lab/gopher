---
sidebar_position: 7
---

# trades

Query live trade history from the SQLite database.

## Usage

```bash
gopher trades [flags]
```

## Flags

| Flag | Description | Default |
|------|-------------|---------|
| `--trader` | Filter by trader ID | All traders |
| `--symbol` | Filter by symbol (e.g., BTC) | All symbols |
| `--mode` | Filter by mode (`paper` or `live`) | All modes |
| `--since` | Filter trades after date (YYYY-MM-DD) | All time |
| `--limit` | Number of results | `50` |
| `--json` | Output as JSON | `false` |
| `--db` | SQLite database path | `~/Documents/Gopher/gopher.db` |

## Examples

```bash
# Recent trades
gopher trades --limit 20

# Filter by symbol and date
gopher trades --symbol BTC --since 2025-01-01

# Export as JSON
gopher trades --trader trader-1 --json > trades.json
```
