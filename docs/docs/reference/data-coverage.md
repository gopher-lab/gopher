---
sidebar_position: 1
---

# Data Coverage

Gopher includes a pre-configured cloud database with historical market data for backtesting.

## Overview

The cloud database provides:

- **200+ assets** from Hyperliquid perpetual futures
- **9 timeframes** from 1-minute to 1-week
- **Up to 394 days** of historical data for major assets
- **Continuous updates** with latest market data

No database setup required - just add your API key and start backtesting.

## Available Timeframes

| Timeframe | Raw Data | Aggregated From | Available Coverage |
|-----------|----------|-----------------|-------------------|
| **1m** | ✓ | - | ~33 days |
| **5m** | - | 1m candles | ~33 days |
| **15m** | - | 1m candles | ~33 days |
| **30m** | - | 1m candles | ~33 days |
| **1h** | ✓ | - | ~119 days |
| **4h** | - | 1h candles | ~119 days |
| **8h** | - | 1h candles | ~119 days |
| **1d** | ✓ | - | ~394 days |
| **1w** | - | 1d candles | ~394 days |

Higher timeframes are computed by aggregating lower-resolution candles. For example:
- 5-minute candles are built from five 1-minute candles
- 4-hour candles are built from four 1-hour candles
- Weekly candles are built from seven daily candles

## Coverage by Trading Style

| Trading Style | Recommended Timeframes | Available History |
|--------------|------------------------|-------------------|
| **Scalping** | 1m, 5m | ~33 days |
| **Day Trading** | 15m, 30m | ~33 days |
| **Intraday** | 1h | ~119 days |
| **Swing Trading** | 4h, 8h | ~119 days |
| **Position Trading** | 1d, 1w | ~394 days |

## Data Quality

| Timeframe | Symbols | With Gaps | Avg Missing |
|-----------|---------|-----------|-------------|
| **1d** | 214 | 0 | 0.00% |
| **1h** | 192 | 4 | 0.02% |
| **1m** | 188 | 184 | 4.99% |

**Note**: Gaps in 1-minute data are expected - they occur when no trades happened during that minute. This is normal market behavior, especially for lower-liquidity pairs.

## Top Assets by Coverage

The following assets have the best data coverage:

| Asset | 1m Coverage | 1h Coverage | 1d Coverage |
|-------|-------------|-------------|-------------|
| **BTC** | 98%+ | 99%+ | 100% |
| **ETH** | 98%+ | 99%+ | 100% |
| **SOL** | 97%+ | 99%+ | 100% |
| **DOGE** | 96%+ | 99%+ | 100% |
| **XRP** | 96%+ | 99%+ | 100% |
| **AVAX** | 95%+ | 99%+ | 100% |
| **LINK** | 95%+ | 99%+ | 100% |
| **ARB** | 94%+ | 98%+ | 100% |
| **OP** | 94%+ | 98%+ | 100% |
| **MATIC** | 93%+ | 98%+ | 100% |

## Checking Coverage

### Desktop App

1. Select an asset and date range
2. The coverage indicator shows percentage before starting evolution
3. Aim for >90% coverage for reliable results

### CLI

```bash
gopher coverage --asset BTC --intervals 15m,1h,4h --start 2025-01-01 --end 2025-01-25
```

Output:
```
Asset: BTC
Date Range: 2025-01-01 to 2025-01-25

Coverage by Interval:
  15m: 98.2% (2,352 / 2,396 candles)
  1h:  99.5% (598 / 601 candles)
  4h:  100%  (150 / 150 candles)

Overall: 99.2% coverage
Status: Good for backtesting
```

## Recommendations

### For Best Results

1. **Use high-coverage assets**: BTC, ETH, SOL have the most reliable data
2. **Match timeframe to coverage**: Use 1d/1w for long backtests, 1m/5m for recent data
3. **Check coverage first**: Aim for >90% before running evolution
4. **Use multiple timeframes**: Combine different resolutions (e.g., 15m + 1h + 4h)

### Date Range Guidelines

| Timeframe | Recommended Range | Max Range |
|-----------|-------------------|-----------|
| 1m, 5m | 7-14 days | ~33 days |
| 15m, 30m | 14-30 days | ~33 days |
| 1h | 30-60 days | ~119 days |
| 4h, 8h | 60-90 days | ~119 days |
| 1d, 1w | 90-180 days | ~394 days |

## Supported Assets

The database includes 200+ Hyperliquid perpetual futures assets. Popular ones include:

**Major Cryptocurrencies:**
BTC, ETH, SOL, XRP, DOGE, ADA, AVAX, DOT, LINK, MATIC

**DeFi Tokens:**
UNI, AAVE, MKR, COMP, SNX, CRV, SUSHI, YFI, 1INCH

**Layer 2 / Scaling:**
ARB, OP, STRK, MANTA, TIA, SEI, SUI, APT

**Meme Coins:**
PEPE, SHIB, FLOKI, BONK, WIF, POPCAT

**Gaming / Metaverse:**
IMX, GALA, AXS, SAND, MANA, ENJ

Use the asset dropdown in the app to see the full list with current coverage levels.

## Local Database

For advanced users who want to use their own data:

1. Set **Data Source** to **Local Database** in Settings
2. Enter your PostgreSQL connection string
3. Ensure your database has the required schema

See [Configuration](/guides/configuration) for connection details.

## Next Steps

- [Quick Start](/guides/quickstart) - Run your first evolution
- [Configuration](/guides/configuration) - Set up timeframes and assets
- [Models](/reference/models) - Choose LLM models for evolution
