# Gopher

AI-powered backtesting and strategy evolution for cryptocurrency trading.

Developed by [Moon Laboratories Inc](https://moonlaboratories.com).

---

## Download

### macOS

1. Download the latest DMG from [Releases](https://github.com/gopher-lab/gopher/releases)
2. Open `Gopher-X.X.X.dmg`
3. Drag **Gopher** to your Applications folder
4. **First launch**: Right-click the app and select "Open" (required for unsigned apps)

> **Note**: macOS may show a security warning for unsigned apps. Click "Open" to proceed.

**Troubleshooting**: If you see "App is damaged and can't be opened":
```bash
xattr -cr /Applications/Gopher.app
```

### Windows

1. Download the latest installer from [Releases](https://github.com/gopher-lab/gopher/releases)
2. Run `Gopher-Setup-X.X.X.exe`
3. Follow the installation wizard

### CLI (Command Line)

Download the CLI binary for your platform:

| Platform | Download |
|----------|----------|
| macOS (Apple Silicon) | `gopher-cli-darwin-arm64` |
| macOS (Intel) | `gopher-cli-darwin-amd64` |
| Windows | `gopher-cli-windows-amd64.exe` |
| Linux | `gopher-cli-linux-amd64` |

Make the binary executable (macOS/Linux):
```bash
chmod +x gopher-cli-*
./gopher-cli-darwin-arm64 --help
```

---

## Features

- **AI Strategy Evolution** - Generate and evolve trading strategies using LLMs
- **Backtesting Engine** - Test strategies against historical market data
- **Monte Carlo Validation** - Statistical validation of strategy robustness
- **Multi-Timeframe Analysis** - Analyze markets across 1m to 1w timeframes
- **200+ Assets** - Pre-configured cloud database with Hyperliquid perpetual futures

---

## Getting Started

### 1. Get an API Key

Gopher uses AI models to generate strategies. You'll need an API key from one of:

| Provider | Description | Get API Key |
|----------|-------------|-------------|
| **OpenRouter** | Access to 100+ models (recommended) | [openrouter.ai/keys](https://openrouter.ai/keys) |
| **OpenAI** | GPT-4, GPT-4o models | [platform.openai.com/api-keys](https://platform.openai.com/api-keys) |

### 2. Configure Settings

1. Open Gopher and click the **Settings** icon (gear)
2. Enter your API key and click **Test** to verify
3. Select your preferred AI models
4. Configure trading parameters (asset, timeframes)

### 3. Run Evolution

1. Go to the **Evolution** tab
2. Select asset and date range
3. Click **Start Evolution**
4. Watch as the AI generates, tests, and improves strategies

---

## Documentation

Full documentation available at: [docs.moonlaboratories.com/gopher](https://docs.moonlaboratories.com/gopher)

---

## Support

- **Issues**: [GitHub Issues](https://github.com/gopher-lab/gopher/issues)
- **Email**: support@moonlaboratories.com

---

## License

Proprietary software. Copyright (c) 2026 Moon Laboratories Inc. All rights reserved.

See [LICENSE](./LICENSE) for full terms.
