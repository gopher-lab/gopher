---
sidebar_position: 3
---

# CLI Installation

Install the Gopher command-line interface for headless operation.

The CLI is ideal for:
- Running backtests on servers
- Automation and scripting
- Integration with other tools
- Users who prefer terminal workflows

## Download

Go to the [Releases page](https://github.com/gopher-lab/gopher/releases) and download the binary for your platform:

| Platform | File |
|----------|------|
| macOS (Apple Silicon) | `gopher-cli-darwin-arm64` |
| macOS (Intel) | `gopher-cli-darwin-amd64` |
| Windows | `gopher-cli-windows-amd64.exe` |
| Linux (x64) | `gopher-cli-linux-amd64` |
| Linux (ARM64) | `gopher-cli-linux-arm64` |

## macOS / Linux Setup

### 1. Download and make executable

```bash
# Example for macOS Apple Silicon
curl -L -o gopher https://github.com/gopher-lab/gopher/releases/latest/download/gopher-cli-darwin-arm64
chmod +x gopher
```

### 2. Move to PATH (optional)

```bash
# Move to a directory in your PATH
sudo mv gopher /usr/local/bin/

# Or add current directory to PATH
export PATH="$PATH:$(pwd)"
```

### 3. Verify installation

```bash
gopher --version
gopher --help
```

### macOS Gatekeeper

On first run, macOS may block the binary. Allow it with:

```bash
xattr -cr ./gopher
```

Or right-click → Open in Finder.

## Windows Setup

### 1. Download

Download `gopher-cli-windows-amd64.exe` from the Releases page.

### 2. Rename (optional)

Rename to `gopher.exe` for convenience.

### 3. Add to PATH (optional)

Add the directory containing `gopher.exe` to your system PATH:

1. Open **Settings** > **System** > **About** > **Advanced system settings**
2. Click **Environment Variables**
3. Edit **Path** under User variables
4. Add the directory containing `gopher.exe`

### 4. Verify installation

```powershell
gopher.exe --version
gopher.exe --help
```

## Configuration

The CLI uses environment variables for configuration.

### Required: API Key

Set your LLM API key:

```bash
# OpenRouter (recommended)
export OPENROUTER_API_KEY='sk-or-v1-your-key-here'

# Or OpenAI
export OPENAI_API_KEY='sk-your-key-here'

# Or Gopher Key
export BART_GOPHER_CODE='gopher_your-key-here'
```

### Optional: Database

By default, Gopher uses the cloud data service. For a local database:

```bash
export DATABASE_URL='postgresql://user:pass@localhost:5432/data'
```

## Basic Usage

### Run a backtest

```bash
gopher backtest \
  --asset BTC \
  --start 2025-01-01 \
  --end 2025-01-25 \
  --intervals 15m,1h,4h \
  --strategy "Follow momentum breakouts with RSI confirmation"
```

### Run evolution

```bash
gopher evolve \
  --asset BTC \
  --start 2025-01-01 \
  --end 2025-01-25 \
  --intervals 15m,1h,4h \
  --iterations 50
```

### List available assets

```bash
gopher assets --top 20
```

### Check data coverage

```bash
gopher coverage --asset BTC --intervals 15m,1h,4h
```

## CLI Options

### Global Options

| Flag | Description |
|------|-------------|
| `--help` | Show help message |
| `--version` | Show version |
| `--config FILE` | Path to config file |
| `--verbose` | Enable verbose output |

### Backtest Options

| Flag | Description | Default |
|------|-------------|---------|
| `--asset` | Trading asset (e.g., BTC, ETH) | Required |
| `--start` | Start date (YYYY-MM-DD) | 7 days ago |
| `--end` | End date (YYYY-MM-DD) | Today |
| `--intervals` | Timeframes (comma-separated) | 15m,1h,4h |
| `--strategy` | Strategy prompt | Required |
| `--model` | LLM model ID | qwen/qwen3-max |

### Evolution Options

| Flag | Description | Default |
|------|-------------|---------|
| `--asset` | Trading asset | Required |
| `--start` | Start date | 7 days ago |
| `--end` | End date | Today |
| `--intervals` | Timeframes | 15m,1h,4h |
| `--iterations` | Max iterations | 50 |
| `--model` | Loop model ID | qwen/qwen3-max |
| `--output` | Output directory | ./results |

## Configuration File

Create a config file for persistent settings:

```yaml
# ~/.gopher/config.yaml
api_key: sk-or-v1-your-key-here
provider: openrouter
model: qwen/qwen3-max
data_source: cloud

defaults:
  asset: BTC
  intervals:
    - 15m
    - 1h
    - 4h
  iterations: 50
```

Use with:

```bash
gopher evolve --config ~/.gopher/config.yaml
```

## Output

Results are saved to JSON files in the output directory:

```
results/
├── session_2025-01-27_143052/
│   ├── session.json       # Session metadata
│   ├── backtest_001.json  # Individual backtest results
│   ├── backtest_002.json
│   └── best_strategy.json # Best performing strategy
```

## Next Steps

- [Quick Start Guide](/guides/quickstart) - Run your first strategy evolution
- [Configuration](/guides/configuration) - Detailed configuration options
- [Data Coverage](/reference/data-coverage) - Available assets and timeframes
