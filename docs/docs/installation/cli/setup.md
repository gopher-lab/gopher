---
sidebar_position: 2
---

# setup

Interactive configuration wizard for Gopher.

## Usage

```bash
gopher setup [flags]
```

## Flags

| Flag | Description | Default |
|------|-------------|---------|
| `--config-dir` | Override config output directory | `~/Documents/Gopher` |
| `--mode` | Pre-select mode (`backtest`, `live`, `both`) | Interactive |
| `--skip-validation` | Skip connection tests | `false` |

## Examples

```bash
# Run the wizard
gopher setup

# Pre-select backtest mode
gopher setup --mode backtest

# Custom output directory
gopher setup --config-dir ./config
```
