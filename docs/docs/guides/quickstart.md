---
sidebar_position: 1
---

# Quick Start

Get up and running with Gopher in 5 minutes.

## Prerequisites

Before you begin:

1. **Install Gopher** - Download from [macOS](/installation/macos), [Windows](/installation/windows), or [CLI](/installation/cli)
2. **Get an API Key** - You'll need an LLM API key (see below)

## Step 1: Get an API Key

Gopher uses AI models to generate and evolve trading strategies. You need an API key from one of these providers:

| Provider | Description | Get Key |
|----------|-------------|---------|
| **OpenRouter** | Access to 100+ models (recommended) | [openrouter.ai/keys](https://openrouter.ai/keys) |
| **OpenAI** | GPT-4, GPT-4o models | [platform.openai.com/api-keys](https://platform.openai.com/api-keys) |

OpenRouter is recommended because it provides access to many models with a single API key.

## Step 2: Configure Gopher

### Desktop App

1. Launch **Gopher** from your Applications folder (macOS) or Start menu (Windows)
2. Click the **Settings** icon (gear) in the sidebar
3. Under **General**, enter your API key:
   - For OpenRouter: Paste in the **OpenRouter API Key** field
   - For OpenAI: Paste in the **OpenAI API Key** field
4. Click **Test** to verify the connection
5. A green checkmark indicates success

### CLI

Set your API key as an environment variable:

```bash
# OpenRouter
export OPENROUTER_API_KEY='sk-or-v1-your-key-here'

# Or OpenAI
export OPENAI_API_KEY='sk-your-key-here'
```

## Step 3: Select Models

In **Settings** > **Models**, select:

| Setting | Recommended | Purpose |
|---------|-------------|---------|
| **Loop Model** | qwen/qwen3-max | Primary model for strategy generation |
| **Backtest Model** | qwen/qwen3-vl-8b-instruct | Faster model for trade decisions |

The defaults work well for most users.

## Step 4: Run Your First Evolution

### Desktop App

1. Go to the **Evolution** tab
2. Configure your run:
   - **Asset**: Select BTC (or another asset)
   - **Date Range**: Last 14 days is a good starting point
   - **Intervals**: Keep defaults (15m, 1h, 4h)
3. Click **Start Evolution**

### CLI

```bash
gopher evolve \
  --asset BTC \
  --start 2025-01-01 \
  --end 2025-01-25 \
  --intervals 15m,1h,4h \
  --iterations 25
```

## What Happens Next

Gopher will now:

1. **Generate** initial trading strategies using AI
2. **Backtest** each strategy against historical data
3. **Analyze** performance (PnL, Sharpe ratio, win rate)
4. **Evolve** strategies based on results
5. **Repeat** until max iterations reached

Watch the progress in real-time:

```
[GOPHER] Asset: BTC
[GOPHER] Date range: 2025-01-11 to 2025-01-25
[GOPHER] Intervals: [15m, 1h, 4h]

Iteration 1:
  Strategy: "Follow momentum breakouts with RSI confirmation"
  PnL: +12.5% | Win Rate: 58% | Trades: 24
  
Iteration 2:
  Strategy: "Mean reversion with Bollinger Band squeeze"
  PnL: +8.3% | Win Rate: 52% | Trades: 31
  
Iteration 3:
  Strategy: "Trend following with EMA crossover and volume"
  PnL: +18.7% | Win Rate: 61% | Trades: 19  ← Best so far!
```

## Monitor Progress

### Desktop App

- **Live Results Table**: Shows each backtest iteration with metrics
- **Performance Chart**: Visualizes PnL progression over iterations
- **Activity Log**: Detailed logs of AI decisions and reasoning

### CLI

Results are printed to stdout and saved to JSON files in the output directory.

## Review Results

### Desktop App

1. Click **Stop** when satisfied, or wait for completion
2. Go to the **History** tab
3. Select the session to view all results
4. Click any result to see:
   - Full strategy description
   - Trade history
   - Performance metrics
   - Entry/exit details

### CLI

Results are saved to:

```
results/
├── session_2025-01-27_143052/
│   ├── session.json
│   ├── backtest_001.json
│   └── best_strategy.json
```

## Tips for Better Results

### Choose Appropriate Timeframes

| Trading Style | Recommended Timeframes |
|--------------|------------------------|
| Scalping | 1m, 5m |
| Day Trading | 15m, 30m |
| Swing Trading | 1h, 4h, 8h |
| Position Trading | 1d, 1w |

### Ensure Good Data Coverage

- Check the coverage indicator (aim for >90%)
- Longer date ranges = more reliable backtests
- Some assets have more historical data than others

### Start Conservative

- Use default risk settings initially (2% risk, 10x leverage)
- Allow 25-50 iterations for meaningful evolution
- Multiple timeframes (e.g., 15m + 1h + 4h) often work better than single

## Next Steps

- [Configuration](/guides/configuration) - Fine-tune all settings
- [Strategy Evolution](/guides/strategy-evolution) - Understand how evolution works
- [Data Coverage](/reference/data-coverage) - See available assets and timeframes
- [Supported Models](/reference/models) - Learn about LLM options
