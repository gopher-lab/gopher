---
sidebar_position: 1
slug: /
---

# Gopher

**AI-powered backtesting and strategy evolution for cryptocurrency trading.**

Gopher uses Large Language Models (LLMs) to autonomously discover, test, and evolve profitable trading strategies. Instead of manually designing rules, Gopher's AI agent continuously generates and refines strategies based on real market data.

> **New to Gopher?** The [CLI](/installation/cli) is the recommended way to use Gopher. It's always the most up-to-date and includes features like live trading that haven't yet reached the desktop apps.

## Key Features

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

## How It Works

```
┌─────────────────────────────────────────────────────────────────┐
│                      Gopher Workflow                             │
│                                                                  │
│  ┌────────┐     ┌─────────┐     ┌────────────┐     ┌────────┐  │
│  │ Setup  │────▶│ Evolve  │────▶│ Validate   │────▶│  Live  │  │
│  └────────┘     │Strategy │     │Monte Carlo │     │Trading │  │
│                 └─────────┘     └────────────┘     └────────┘  │
│                      │                │                 │       │
│  ┌────────┐          ▼                │                 ▼       │
│  │ Assets │    ┌─────────┐            │           ┌────────┐   │
│  │Coverage│    │Backtest │◀───────────┘           │ Query  │   │
│  └────────┘    │ History │                        │ Trades │   │
│                └─────────┘                        └────────┘   │
└─────────────────────────────────────────────────────────────────┘
```

1. **Setup** - Configure API keys and data sources via the wizard
2. **Evolve** - AI-powered autonomous strategy discovery and refinement
3. **Validate** - Monte Carlo simulation for statistical robustness
4. **Live Trading** - Deploy strategies to Hyperliquid (paper or live)
5. **Backtest** - Run individual backtests with specific strategies
6. **History** - Review past sessions and results
7. **Assets/Coverage** - Check available assets and data availability

## Get Started

:::tip Recommended: Command-Line Interface
The **CLI is the primary entry point** for Gopher and always has the latest features. Desktop apps follow behind in development and currently do not support live trading.

If you want access to **live trading** and the newest capabilities, use the CLI.
:::

| Platform | Description | Live Trading |
|----------|-------------|:------------:|
| [**CLI**](/installation/cli) | Command-line interface for all platforms (recommended) | ✅ |
| [**macOS**](/installation/macos) | Desktop app for Apple Silicon and Intel Macs | ❌ |
| [**Windows**](/installation/windows) | Desktop app for Windows 10/11 | ❌ |

Jump straight to the [Quick Start Guide](/guides/quickstart) to run your first strategy evolution with the CLI.

## Requirements

- **API Access**: **Gopher Key** (recommended - [get started](https://gotrader.gopher-ai.com/settings)) or bring your own OpenRouter/OpenAI key
- **Internet**: Connection to cloud data service
- **System**: macOS 11+, Windows 10+, or Linux (CLI only)

## Support

- **Documentation**: You're reading it!
- **Issues**: [GitHub Issues](https://github.com/gopher-lab/gopher/issues)
- **Contact**: [hello@gopher-ai.com](mailto:hello@gopher-ai.com)

---

**Gopher** is developed by [Moon Laboratories Inc](https://gotrader.gopher-ai.com).
