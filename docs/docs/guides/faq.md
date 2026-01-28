---
sidebar_position: 6
---

# Frequently Asked Questions

Common questions about installing and using Gopher.

---

## Installation

### Can I install Gopher anywhere on my system?

**Yes!** You can place `gopher.exe` (or the `gopher` binary on macOS/Linux) in any folder you like, such as `C:\gopher` on Windows.

A few tips:

- **Add to PATH** (recommended) — Lets you run `gopher` from any directory:
  - **Windows**: Search "Environment Variables" → Edit "Path" → Add your folder (e.g., `C:\gopher`)
  - **macOS/Linux**: Add `export PATH="/your/path:$PATH"` to your shell profile

- **First run on Windows** — Windows SmartScreen may show a warning since the executable isn't signed. Click "More info" → "Run anyway"

- **Alternative locations** if you hit permission issues:
  - `C:\Users\YourName\gopher` (no admin needed)
  - `/usr/local/bin/` (macOS/Linux standard location)

### Where does Gopher store its configuration?

Gopher stores all settings in a fixed location based on your home directory — **not** where the executable is located.

| Platform | Config Path |
|----------|-------------|
| **Windows** | `C:\Users\<username>\Documents\BART\config.json` |
| **macOS** | `~/Documents/BART/config.json` |
| **Linux** | `~/Documents/BART/config.json` |

**Additional folders:**

| Folder | Purpose |
|--------|---------|
| `Documents/BART/sessions/` | Strategy evolution session data |
| `Documents/BART/logs/` | Application logs |

Run `gopher setup` to create or update your configuration.

### Why is the folder called "BART" instead of "Gopher"?

BART (Backtesting and Algorithmic Research Tool) was the original project codename. The folder name is kept for backward compatibility with existing installations.

---

## CLI vs Desktop Apps

### Which should I use — CLI or Desktop App?

**Use the CLI** if you want:
- The latest features (CLI is always ahead in development)
- Live trading capabilities
- Automation and scripting
- Running on Linux or servers

**Use the Desktop App** if you prefer:
- A graphical interface
- Simpler setup for beginners
- You don't need live trading (yet)

### Does the Desktop App support live trading?

**Not yet.** Live trading is currently only available in the CLI. Desktop apps are focused on backtesting and strategy evolution. Live trading support will be added in a future release.

---

## Configuration

### How do I change my API keys after setup?

Run the setup wizard again:

```bash
gopher setup
```

This will walk you through updating your configuration, including API keys.

### Can I use my own OpenAI/OpenRouter API key?

Yes! During setup, select your preferred LLM provider:

- **Gopher Key** (recommended) — Managed service, no external API key needed
- **OpenRouter** — Bring your own OpenRouter API key
- **OpenAI** — Bring your own OpenAI API key

### Where can I get a Gopher Key?

Visit [gotrader.gopher-ai.com/settings](https://gotrader.gopher-ai.com/settings) to get your Gopher Key.

---

## Trading

### What exchanges does Gopher support?

Currently, Gopher supports **Hyperliquid** perpetual futures only. Support for additional exchanges may be added in the future.

### Is my private key safe?

Your Hyperliquid private key is stored locally in your config file (`Documents/BART/config.json`) and is **never sent to any external server**. All trading operations are executed directly from your machine to Hyperliquid.

### What's the difference between paper and live trading?

| Mode | Description |
|------|-------------|
| **Paper** | Simulated trading on Hyperliquid testnet — no real money |
| **Live** | Real trading on Hyperliquid mainnet — uses real funds |

Always test strategies in paper mode before going live.

---

## Troubleshooting

### Gopher says "API key required" but I entered one

Make sure you've selected the correct provider during setup. If you're using a Gopher Key, select the Gopher Key option — not OpenRouter or OpenAI.

Run `gopher setup` to reconfigure.

### I get a "permission denied" error on macOS/Linux

Make the binary executable:

```bash
chmod +x gopher
```

### Windows Defender blocks gopher.exe

This happens because the executable isn't signed. You can:
1. Click "More info" → "Run anyway" when the SmartScreen warning appears
2. Add an exception in Windows Security settings

---

## Still have questions?

- **Documentation**: [gopher-lab.github.io/gopher](https://gopher-lab.github.io/gopher/)
- **Bug Reports**: [Submit a bug report](https://github.com/gopher-lab/gopher/issues/new?template=bug_report.md)
- **Feature Requests**: [Request a feature](https://github.com/gopher-lab/gopher/issues/new?template=feature_request.md)
- **Email**: [hello@gopher-ai.com](mailto:hello@gopher-ai.com)
