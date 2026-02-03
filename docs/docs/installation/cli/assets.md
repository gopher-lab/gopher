---
sidebar_position: 10
slug: /installation/cli/assets
---

# assets

List available trading assets from the data source.

## Usage

```bash
gopher assets [flags]
```

## Flags

| Flag | Description | Default |
|------|-------------|---------|
| `--top` | Show top N assets by volume | All |
| `--json` | Output as JSON | `false` |
| `--api-key` | API key for data service | Usually not required |

## Examples

```bash
# List all assets
gopher assets

# Top 20 assets by volume
gopher assets --top 20

# Output as JSON
gopher assets --json
```
