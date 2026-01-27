---
sidebar_position: 1
slug: /
---

# Gopher

**AI-powered backtesting and strategy evolution for cryptocurrency trading.**

Gopher uses Large Language Models (LLMs) to autonomously discover, test, and evolve profitable trading strategies. Instead of manually designing rules, Gopher's AI agent continuously generates and refines strategies based on real market data.

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
┌─────────────────────────────────────────────────────────────┐
│                   Strategy Evolution Loop                    │
│                                                              │
│   ┌──────────┐     ┌──────────┐     ┌──────────┐           │
│   │ Generate │────▶│ Backtest │────▶│ Analyze  │           │
│   │ Strategy │     │ Strategy │     │ Results  │           │
│   └──────────┘     └──────────┘     └──────────┘           │
│        ▲                                 │                  │
│        │           ┌──────────┐          │                  │
│        └───────────│  Evolve  │◀─────────┘                  │
│                    │ Strategy │                             │
│                    └──────────┘                             │
└─────────────────────────────────────────────────────────────┘
```

1. **Generate** - The AI creates trading strategies based on technical analysis
2. **Backtest** - Strategies are tested against historical market data
3. **Analyze** - Performance metrics are evaluated (PnL, Sharpe, win rate)
4. **Evolve** - The AI refines strategies based on results and repeats

## Get Started

Choose your platform to begin:

| Platform | Description |
|----------|-------------|
| [**macOS**](/installation/macos) | Desktop app for Apple Silicon and Intel Macs |
| [**Windows**](/installation/windows) | Desktop app for Windows 10/11 |
| [**CLI**](/installation/cli) | Command-line interface for all platforms |

Or jump straight to the [Quick Start Guide](/guides/quickstart) to run your first strategy evolution.

## Requirements

- **API Access**: Gopher Credits ([get started](https://gotrader.gopher-ai.com/settings)) or your own OpenRouter/OpenAI key
- **Internet**: Connection to cloud data service
- **System**: macOS 11+, Windows 10+, or Linux (CLI only)

## Support

- **Documentation**: You're reading it!
- **Issues**: [GitHub Issues](https://github.com/gopher-lab/gopher/issues)
- **Contact**: [hello@gopher-ai.com](mailto:hello@gopher-ai.com)

---

**Gopher** is developed by [Moon Laboratories Inc](https://gotrader.gopher-ai.com).
