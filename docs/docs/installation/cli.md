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
- **Full feature parity with the desktop app**

## Download

Go to the [Releases page](https://github.com/gopher-lab/gopher/releases) and download the binary for your platform:

| Platform | File |
|----------|------|
| macOS (Apple Silicon) | `gopher-{version}-darwin-arm64.tar.gz` |
| macOS (Intel) | `gopher-{version}-darwin-amd64.tar.gz` |
| Windows | `gopher-{version}-windows-amd64.zip` |
| Linux (x64) | `gopher-{version}-linux-amd64.tar.gz` |

## macOS / Linux Setup

### 1. Download and extract

**Option A: One-liner install script (recommended)**

```bash
# Detects your platform and installs the latest version
curl -sSL https://raw.githubusercontent.com/gopher-lab/gopher/main/install.sh | bash
```

**Option B: Manual download**

Visit the [Releases page](https://github.com/gopher-lab/gopher/releases), download the appropriate file for your platform, then:

```bash
# Extract (replace FILENAME with your downloaded file)
tar -xzf gopher-*-darwin-arm64.tar.gz   # macOS Apple Silicon
tar -xzf gopher-*-darwin-amd64.tar.gz   # macOS Intel
tar -xzf gopher-*-linux-amd64.tar.gz    # Linux

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

### 1. Download and extract

Download `gopher-{version}-windows-amd64.zip` from the Releases page and extract it.

### 2. Add to PATH (optional)

Add the directory containing `gopher.exe` to your system PATH:

1. Open **Settings** > **System** > **About** > **Advanced system settings**
2. Click **Environment Variables**
3. Edit **Path** under User variables
4. Add the directory containing `gopher.exe`

### 3. Verify installation

```powershell
gopher.exe --version
gopher.exe --help
```

## Configuration

### Quick Setup (Recommended)

Run the interactive wizard to configure everything:

```bash
gopher setup
```

This guides you through:
- Selecting trading mode (backtest only, live only, or both)
- Configuring LLM API key (**Gopher Key recommended**, or OpenRouter)
- **Entering your Hyperliquid private key** (securely saved to `.env`)
- Setting up trading parameters

The wizard securely stores your credentials in `~/Documents/Gopher/.env`.

### Manual Configuration

#### Gopher Key (Recommended)

The easiest way to get started - use Gopher's hosted inference:

1. Go to [gotrader.gopher-ai.com/settings](https://gotrader.gopher-ai.com/settings)
2. Create an account and get your **Gopher Key** (starts with `gopher_`)

```bash
# Add to ~/.zshrc or ~/.bashrc
export BART_GOPHER_CODE='gopher_your-key-here'
```

#### Alternative: OpenRouter API Key

Bring your own API key from [OpenRouter](https://openrouter.ai/):

```bash
# Add to ~/.zshrc or ~/.bashrc
export OPENROUTER_API_KEY='sk-or-v1-your-key-here'
```

#### Hyperliquid Private Key (Live Trading)

For live trading on Hyperliquid:

1. Go to [Hyperliquid](https://app.hyperliquid.xyz/) and connect your wallet
2. Navigate to **Settings** → **API Wallet**
3. Click **Generate API Wallet** and copy the private key

```bash
# Add to ~/.zshrc or ~/.bashrc (NEVER commit this!)
export TRADER_PRIVATE_KEY='0x-your-private-key-here'
```

:::warning Security
- Never commit private keys to version control
- Add `.env` files to `.gitignore`
- Use environment variables, not hardcoded values
:::

### Configuration Files

Gopher stores configuration in `~/Documents/Gopher/`:

| File | Purpose |
|------|---------|
| `settings.json` | App settings and API keys |
| `traders.yaml` | Live trading configuration |
| `gopher.db` | SQLite database for backtests and trades |
| `sessions/` | Evolution session files |
| `logs/` | Application logs |

## Available Commands

The Gopher CLI provides these commands with **full feature parity** to the desktop app:

| Command | Description |
|---------|-------------|
| `gopher setup` | Interactive configuration wizard |
| `gopher evolve` | **Autonomous strategy evolution** (the main feature!) |
| `gopher backtest` | Run a single backtest with a strategy prompt |
| `gopher montecarlo` | Monte Carlo strategy validation |
| `gopher live` | Start live trading on Hyperliquid |
| `gopher trades` | Query trade history from the database |
| `gopher history` | View backtest history and sessions |
| `gopher coverage` | Check data coverage for an asset |
| `gopher assets` | List available trading assets |

Run `gopher <command> --help` for detailed usage of each command.

## Configuration

### Interactive Setup (Recommended)

The easiest way to configure Gopher is with the interactive wizard:

```bash
gopher setup
```

This guides you through:
- Authentication (Gopher Key or OpenRouter)
- Data source selection (cloud or local)
- Mode selection (backtest, live trading, or both)

### Environment Variables

Alternatively, set environment variables directly:

```bash
# Option 1: Gopher Credits (recommended - easiest)
# Get your key at https://gotrader.gopher-ai.com/settings
export BART_GOPHER_CODE='gopher_your-key-here'

# Option 2: OpenRouter
export OPENROUTER_API_KEY='sk-or-v1-your-key-here'
```

**Gopher Credits** are the easiest option - no external API accounts needed. Purchase credits at [gotrader.gopher-ai.com/settings](https://gotrader.gopher-ai.com/settings).

:::tip API Key Routing
Gopher automatically detects your API key type:
- **Gopher Keys** (`gopher_xxx`) → Routes to Gopher API (ignores `--base-url`)
- **OpenRouter Keys** (`sk-or-xxx`) → Routes to OpenRouter (or custom `--base-url`)
- **Other Keys** → Uses your specified `--base-url`
:::

## Basic Usage

### Run strategy evolution

```bash
gopher evolve \
  --asset BTC \
  --start 2025-01-01 \
  --end 2025-01-25 \
  --iterations 50 \
  --prompt "Focus on momentum breakouts"
```

### Run a single backtest

```bash
gopher backtest \
  --asset BTC \
  --prompt "Follow momentum breakouts with RSI confirmation" \
  --start 2025-01-01 \
  --end 2025-01-25 \
  --intervals 15m,1h,4h
```

### Monte Carlo validation

```bash
gopher montecarlo \
  --asset ETH \
  --prompt "Mean reversion with Bollinger Bands" \
  --runs 50
```

### Start live trading (paper mode)

```bash
gopher live --config traders.yaml --mode paper
```

### Query trade history

```bash
# Table format
gopher trades --limit 50

# JSON format
gopher trades --symbol BTC --json
```

## Command Reference

### `gopher setup`

Interactive configuration wizard.

```bash
gopher setup [flags]
```

| Flag | Description | Default |
|------|-------------|---------|
| `--config-dir` | Override config output directory | `~/Documents/Gopher` |
| `--mode` | Pre-select mode (backtest/live/both) | Interactive |
| `--skip-validation` | Skip connection tests | `false` |

### `gopher evolve`

Run autonomous AI-powered strategy evolution. This is the primary feature that iteratively evolves trading strategies through backtesting.

```bash
gopher evolve --asset <ASSET> [flags]
```

| Flag | Description | Default |
|------|-------------|---------|
| `--asset` | Trading asset (e.g., BTC, ETH) | **Required** |
| `--start` | Start date (YYYY-MM-DD) | 7 days ago |
| `--end` | End date (YYYY-MM-DD) | Today |
| `--intervals` | Candle intervals | `15m,1h,4h` |
| `--prompt` | Strategy guidance prompt | None |
| `--iterations` | Maximum iterations (1-200) | `50` |
| `--leverage` | Trading leverage | `10` |
| `--model` | LLM model for strategy evolution | `qwen/qwen3-max` |
| `--backtest-model` | LLM model for backtest decisions | `qwen/qwen3-vl-8b-instruct` |
| `--api-key` | LLM API key | `$BART_GOPHER_CODE` or `$OPENROUTER_API_KEY` |
| `--base-url` | LLM API base URL | OpenRouter |
| `--db` | SQLite database path | `~/Documents/Gopher/gopher.db` |
| `--output` | Output directory for sessions | `~/Documents/Gopher/sessions` |
| `--resume` | Resume a previous session | None |
| `--json` | Output final results as JSON | `false` |

**Examples:**

```bash
# Basic evolution
gopher evolve --asset BTC --start 2025-01-01 --end 2025-01-25

# Extended evolution with more iterations
gopher evolve --asset ETH --iterations 100 --leverage 5

# Resume an interrupted session
gopher evolve --resume ~/Documents/Gopher/sessions/agent_20250127_143052.session.json

# Custom strategy guidance
gopher evolve --asset SOL --prompt "Focus on volatility breakouts during Asian session"
```

### `gopher backtest`

Run a single backtest simulation.

```bash
gopher backtest --asset <ASSET> --prompt <STRATEGY> [flags]
```

| Flag | Description | Default |
|------|-------------|---------|
| `--asset` | Trading asset (e.g., BTC, ETH) | **Required** |
| `--prompt` | Strategy prompt | **Required** |
| `--start` | Start date (YYYY-MM-DD) | 7 days ago |
| `--end` | End date (YYYY-MM-DD) | Today |
| `--intervals` | Candle intervals | `15m,1h,4h` |
| `--leverage` | Trading leverage | `10` |
| `--model` | LLM model for decisions | `qwen/qwen3-vl-8b-instruct` |
| `--api-key` | LLM API key | `$BART_GOPHER_CODE` or `$OPENROUTER_API_KEY` |
| `--base-url` | LLM API base URL (ignored for Gopher keys) | `https://openrouter.ai/api/v1` |
| `--json` | Output results as JSON | `false` |
| `--db` | SQLite database path | `~/Documents/Gopher/gopher.db` |
| `--output` | Output directory for results | `~/Documents/Gopher/sessions` |

**Example:**

```bash
gopher backtest \
  --asset ETH \
  --prompt "Mean reversion strategy using Bollinger Bands" \
  --start 2025-01-01 \
  --end 2025-01-20 \
  --intervals 1h,4h \
  --leverage 5 \
  --json
```

### `gopher montecarlo`

Run Monte Carlo validation to statistically validate a trading strategy across multiple runs.

```bash
gopher montecarlo --asset <ASSET> --prompt <STRATEGY> [flags]
```

Alias: `gopher mc`

| Flag | Description | Default |
|------|-------------|---------|
| `--asset` | Trading asset (e.g., BTC, ETH) | **Required** |
| `--prompt` | Strategy prompt | **Required** |
| `--runs` | Number of Monte Carlo runs (10-500) | `100` |
| `--start` | Start date (YYYY-MM-DD) | 7 days ago |
| `--end` | End date (YYYY-MM-DD) | Today |
| `--intervals` | Candle intervals | `15m,1h,4h` |
| `--model` | LLM model for decisions | `qwen/qwen3-vl-8b-instruct` |
| `--api-key` | LLM API key | `$BART_GOPHER_CODE` or `$OPENROUTER_API_KEY` |
| `--base-url` | LLM API base URL | OpenRouter |
| `--db` | SQLite database path | `~/Documents/Gopher/gopher.db` |
| `--json` | Output results as JSON | `false` |

**Examples:**

```bash
# Basic Monte Carlo validation
gopher montecarlo --asset BTC --prompt "Follow momentum breakouts" --runs 50

# Comprehensive validation with 100 runs
gopher mc --asset ETH --prompt "Mean reversion with Bollinger Bands" --runs 100 --json
```

**Output includes:**
- Average PnL, win rate, Sharpe ratio across all runs
- Best and worst performing runs
- Statistical confidence metrics

### `gopher live`

Start live trading on Hyperliquid.

```bash
gopher live [flags]
```

| Flag | Description | Default |
|------|-------------|---------|
| `--config` | Path to traders.yaml config | `traders.yaml` |
| `--mode` | Trading mode (paper/live) | `paper` |
| `--strategy` | Strategy prompt | Default strategy |
| `--orchestrator` | Use LLM for dynamic strategy selection | `false` |
| `--llm-api-key` | LLM API key | `$OPENROUTER_API_KEY` |
| `--llm-base-url` | LLM API base URL | OpenRouter |
| `--db` | SQLite database path | `gopher.db` |

**Paper trading (testnet):**

```bash
gopher live --config traders.yaml --mode paper
```

**Live trading (mainnet - real funds!):**

```bash
gopher live --config traders.yaml --mode live
```

**With LLM orchestrator:**

```bash
gopher live --config traders.yaml --orchestrator --db gopher.db
```

### `gopher trades`

Query trade history from the database.

```bash
gopher trades [flags]
```

| Flag | Description | Default |
|------|-------------|---------|
| `--trader` | Filter by trader ID | All traders |
| `--symbol` | Filter by symbol (e.g., BTC) | All symbols |
| `--mode` | Filter by mode (paper/live) | All modes |
| `--since` | Filter trades after date (YYYY-MM-DD) | All time |
| `--limit` | Number of results | `50` |
| `--json` | Output in JSON format | `false` |
| `--db` | SQLite database path | `~/Documents/Gopher/gopher.db` |

**Examples:**

```bash
# Recent trades
gopher trades --limit 20

# Filter by symbol
gopher trades --symbol BTC --since 2025-01-01

# Export as JSON
gopher trades --trader trader-1 --json > trades.json
```

### `gopher history`

View and manage backtest history and sessions.

```bash
gopher history [flags]
```

| Flag | Description | Default |
|------|-------------|---------|
| `--session` | Filter by session ID | All sessions |
| `--symbol` | Filter by symbol (e.g., BTC) | All symbols |
| `--limit` | Number of results | `50` |
| `--grouped` | Group results by session | `false` |
| `--resumable` | Show only resumable sessions | `false` |
| `--json` | Output as JSON | `false` |
| `--db` | SQLite database path | `~/Documents/Gopher/gopher.db` |

**Subcommands:**

```bash
gopher history delete <id>    # Delete a backtest or session
```

**Examples:**

```bash
# List recent backtests
gopher history

# Group by session
gopher history --grouped

# Show resumable sessions (for evolution)
gopher history --resumable

# Filter by session
gopher history --session abc123 --json

# Delete a backtest
gopher history delete <backtest-id>
```

### `gopher coverage`

Check data coverage and warmup status for an asset before running backtests.

```bash
gopher coverage --asset <ASSET> [flags]
```

| Flag | Description | Default |
|------|-------------|---------|
| `--asset` | Trading asset (e.g., BTC, ETH) | **Required** |
| `--start` | Start date (YYYY-MM-DD) | 7 days ago |
| `--end` | End date (YYYY-MM-DD) | Today |
| `--intervals` | Candle intervals to check | `15m,1h,4h` |
| `--optimal` | Find optimal date range | `false` |
| `--json` | Output as JSON | `false` |
| `--api-key` | API key for data service | Usually not required |

**Examples:**

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

**Output includes:**
- Coverage percentage (need ≥65% for backtesting)
- Warmup status for each interval (20 candles required)
- Recommendations if coverage is insufficient

### `gopher assets`

List available trading assets from Hyperliquid.

```bash
gopher assets [flags]
```

| Flag | Description | Default |
|------|-------------|---------|
| `--top` | Show top N assets by volume | All |
| `--json` | Output as JSON | `false` |
| `--api-key` | API key for data service | Usually not required |

**Examples:**

```bash
# List all assets
gopher assets

# Top 20 assets by volume
gopher assets --top 20

# Output as JSON
gopher assets --json
```

## Output

### Evolution Results

Evolution sessions are saved and can be resumed:

```
~/Documents/Gopher/sessions/
├── agent_20250127_143052/
│   ├── session.json      # Session state (resumable)
│   └── backtests/        # Individual backtest results
```

### Backtest Results

Results are saved to the output directory:

```
~/Documents/Gopher/sessions/
├── backtest_BTC_1706123456789/
│   └── result.json
```

Results include:
- Total PnL percentage
- Win rate
- Sharpe ratio
- Max drawdown
- Individual trade details

### Trade History

The `trades` command displays a formatted table:

```
TIME                  SYMBOL  SIDE  ENTRY     EXIT      PNL       REASON
2025-01-27 14:30:05   BTC     long  42500.00  43000.00  +$125.00  take_profit
2025-01-27 12:15:22   ETH     short 2250.00   2200.00   +$50.00   take_profit

Summary: 15 trades | Total PnL: +$850.00 | Win Rate: 60.0%
```

## Workflow Examples

### Quick Start Script

The fastest way to experience Gopher is with the provided quickstart script.

**Step 1: Set your API key**

Get your Gopher Key from [gotrader.gopher-ai.com/settings](https://gotrader.gopher-ai.com/settings), then set it in your terminal:

**macOS / Linux:**

```bash
export BART_GOPHER_CODE='gopher_your-key-here'
```

**Windows (PowerShell):**

```powershell
$env:BART_GOPHER_CODE='gopher_your-key-here'
```

Replace `gopher_your-key-here` with your actual key (starts with `gopher_`).

**Step 2: Download and run the script**

**macOS / Linux:**

```bash
curl -sSL https://raw.githubusercontent.com/gopher-lab/gopher/main/quickstart-tao.sh -o quickstart-tao.sh
chmod +x quickstart-tao.sh
./quickstart-tao.sh
```

**Windows (PowerShell):**

```powershell
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/gopher-lab/gopher/main/quickstart-tao.ps1" -OutFile "quickstart-tao.ps1"
.\quickstart-tao.ps1
```

This script runs evolution on TAO with a tested multi-timeframe configuration (15m, 30m, 1h intervals over a 25-day rolling window).

### Complete Evolution Workflow

```bash
# 1. Check available assets
gopher assets --top 20

# 2. Verify data coverage for your chosen asset
gopher coverage --asset BTC --optimal

# 3. Run strategy evolution
gopher evolve --asset BTC --start 2025-01-01 --end 2025-01-25 --iterations 50

# 4. Validate best strategy with Monte Carlo
gopher montecarlo --asset BTC --prompt "Your evolved strategy here" --runs 100

# 5. View evolution history
gopher history --grouped

# 6. Start paper trading with validated strategy
gopher live --config traders.yaml --mode paper
```

### Automation Script Example

```bash
#!/bin/bash
# daily_evolution.sh - Run nightly evolution

ASSET="BTC"
START=$(date -d "7 days ago" +%Y-%m-%d)
END=$(date +%Y-%m-%d)

gopher evolve \
  --asset $ASSET \
  --start $START \
  --end $END \
  --iterations 100 \
  --json > results/evolution_$(date +%Y%m%d).json 2>&1
```

## Next Steps

- [Quick Start Guide](/guides/quickstart) - Run your first backtest
- [Configuration](/guides/configuration) - Detailed configuration options
- [Data Coverage](/reference/data-coverage) - Available assets and timeframes
