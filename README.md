# Gopher

**AI-powered backtesting and strategy evolution for cryptocurrency trading.**

Gopher uses Large Language Models (LLMs) to autonomously discover, test, and evolve profitable trading strategies. Instead of manually designing rules, Gopher's AI agent continuously generates and refines strategies based on real market data.

Developed by [Moon Laboratories Inc](https://gotrader.gopher-ai.com).

---

## Quick Start

> **Recommended: Command-Line Interface**  
> The **CLI is the primary entry point** for Gopher and always has the latest features. Desktop apps follow behind in development and currently do not support live trading.

### Install CLI

Download the latest release for your platform from [Releases](https://github.com/gopher-lab/gopher/releases):

| Platform | File |
|----------|------|
| macOS (Apple Silicon) | `gopher-{version}-darwin-arm64.tar.gz` |
| macOS (Intel) | `gopher-{version}-darwin-amd64.tar.gz` |
| Windows | `gopher-{version}-windows-amd64.zip` |
| Linux (x64) | `gopher-{version}-linux-amd64.tar.gz` |

**macOS / Linux:**
```bash
# Download and extract
curl -L -o gopher.tar.gz https://github.com/gopher-lab/gopher/releases/latest/download/gopher-0.3.0-darwin-arm64.tar.gz
tar -xzf gopher.tar.gz
chmod +x gopher

# Optional: Add to PATH
sudo mv gopher /usr/local/bin/

# Verify installation
gopher --version
```

**Windows:**
1. Download and extract `gopher-{version}-windows-amd64.zip`
2. Add the directory containing `gopher.exe` to your PATH
3. Run `gopher.exe --version` to verify

**First-time setup:**
```bash
gopher setup
```

This interactive wizard configures API keys, trading mode, and Hyperliquid credentials.

---

## Features

### Autonomous Strategy Discovery
Gopher's AI agent generates trading strategies in natural language, tests them against historical data, and evolves them based on performance feedback.

### Multi-Timeframe Analysis
Analyze markets across 9 timeframes (1m, 5m, 15m, 30m, 1h, 4h, 8h, 1d, 1w) for comprehensive technical analysis and strategy optimization.

### Monte Carlo Validation
Statistically validate strategies through Monte Carlo simulations to ensure robustness across different market conditions.

### 200+ Crypto Assets
Pre-configured cloud database with historical data for 200+ Hyperliquid perpetual futures assets, ready to use immediately.

### Built-in Risk Management
Configurable position sizing, stop-loss levels, leverage controls, and maximum margin utilization to manage risk effectively.

---

## Desktop Apps

Desktop applications are available but lag behind the CLI in development:

| Platform | Status | Live Trading |
|----------|--------|:------------:|
| **CLI** | ✅ Recommended | ✅ |
| macOS | ⚠️ Available | ❌ |
| Windows | ⚠️ Available | ❌ |

**macOS:**
1. Download the latest DMG from [Releases](https://github.com/gopher-lab/gopher/releases)
2. Open `Gopher-X.X.X.dmg` and drag to Applications
3. Right-click → Open (required for unsigned apps)

**Windows:**
1. Download `Gopher-Setup-X.X.X.exe` from [Releases](https://github.com/gopher-lab/gopher/releases)
2. Run the installer and follow the wizard

> **Note**: Desktop apps do not yet support live trading. Use the CLI for full feature access.

---

## Documentation

Full documentation with guides, API reference, and examples:

**[https://gopher-lab.github.io/gopher/](https://gopher-lab.github.io/gopher/)**

---

## Support

- **Documentation**: [gopher-lab.github.io/gopher](https://gopher-lab.github.io/gopher/)
- **Bug Reports**: [GitHub Issues](https://github.com/gopher-lab/gopher/issues/new?template=bug_report.md)
- **Feature Requests**: [GitHub Issues](https://github.com/gopher-lab/gopher/issues/new?template=feature_request.md)
- **Email**: [hello@gopher-ai.com](mailto:hello@gopher-ai.com)

---

## License

Proprietary software. Copyright (c) 2026 Moon Laboratories Inc. All rights reserved.

See [LICENSE](./LICENSE) for full terms.
