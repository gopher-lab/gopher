---
sidebar_position: 1
slug: /installation/cli
---

# CLI Overview

Install the `gopher` command-line interface for headless operation and automation.

The CLI is ideal for:
- Running backtests on servers
- Automation and scripting
- Integration with other tools
- Users who prefer terminal workflows
- Full feature parity with the desktop app

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

Or right-click -> Open in Finder.

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
- Configuring LLM API key (Gopher Key recommended, or OpenRouter)
- Entering your Hyperliquid private key (securely saved to `.env`)
- Setting up trading parameters

The wizard stores credentials in `~/Documents/Gopher/.env`.

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
2. Navigate to **Settings** -> **API Wallet**
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

## CLI Commands

Use `gopher <command> --help` for detailed usage of each command.

- [setup](/installation/cli/setup)
- [evolve](/installation/cli/evolve)
- [backtest](/installation/cli/backtest)
- [montecarlo](/installation/cli/montecarlo)
- [live](/installation/cli/live)
- [trades](/installation/cli/trades)
- [history](/installation/cli/history)
- [coverage](/installation/cli/coverage)
- [assets](/installation/cli/assets)

## Quick Start

```bash
# Backtest
gopher backtest --asset TAO --prompt "Simple momentum" \
  --start 2025-01-01 --end 2025-01-03 \
  --intervals 8h --eval-interval 8h

# Monte Carlo
gopher montecarlo --asset TAO --prompt "Simple momentum" --runs 10 \
  --start 2025-01-01 --end 2025-01-03 \
  --intervals 8h --eval-interval 8h

# Evolution
gopher evolve --asset TAO --iterations 1 --montecarlo-runs 10 \
  --start 2025-01-01 --end 2025-01-03 \
  --intervals 8h --eval-interval 8h
```

## Output Locations

### Evolution Sessions

```
~/Documents/Gopher/sessions/
|-- agent_20250127_143052/
|   |-- session.json      # Session state (resumable)
|   `-- backtests/        # Individual backtest results
```

### Backtest Results

```
~/Documents/Gopher/sessions/
|-- backtest_BTC_1706123456789/
|   `-- result.json
```

### Trade History (Example)

```
TIME                  SYMBOL  SIDE  ENTRY     EXIT      PNL       REASON
2025-01-27 14:30:05   BTC     long  42500.00  43000.00  +$125.00  take_profit
2025-01-27 12:15:22   ETH     short 2250.00   2200.00   +$50.00   take_profit

Summary: 15 trades | Total PnL: +$850.00 | Win Rate: 60.0%
```

## Next Steps

- [Quick Start Guide](/guides/quickstart)
- [Configuration](/guides/configuration)
- [Data Coverage](/reference/data-coverage)
