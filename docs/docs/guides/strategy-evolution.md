---
sidebar_position: 3
---

# Strategy Evolution

Understanding how Gopher discovers and evolves trading strategies.

## Overview

Gopher uses an AI-driven evolutionary approach to discover profitable trading strategies. Instead of manually designing rules, the AI:

1. **Generates** trading strategies in natural language
2. **Backtests** them against historical market data
3. **Analyzes** performance and identifies weaknesses
4. **Evolves** strategies based on feedback
5. **Repeats** until finding high-performing strategies

## The Evolution Loop

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

## Phase 1: Strategy Generation

The AI generates trading strategies in natural language. For example:

```
"Follow momentum breakouts. Enter long when price breaks above
the 20-period high with RSI above 50 and increasing volume.
Use a 2% stop loss from entry and target 3:1 reward-to-risk."
```

### What the AI Considers

- **Market conditions**: Trending, ranging, volatile
- **Technical indicators**: RSI, MACD, Bollinger Bands, moving averages
- **Volume patterns**: Confirmation signals, divergences
- **Support/resistance**: Key price levels
- **Recent price action**: Candlestick patterns, momentum

## Phase 2: Backtesting

Each strategy is tested against historical market data:

1. **Load data**: Fetch candles for selected timeframes
2. **Warm-up**: Calculate indicators (requires ~20 candles)
3. **Decision loop**: At each evaluation interval:
   - Build context with market data
   - AI decides: `long`, `short`, `close_long`, `close_short`, or `wait`
   - Execute trade in simulated wallet
4. **Track performance**: Record PnL, win rate, drawdown, Sharpe

### Example Backtest Sequence

```
Evaluation 1 (2025-01-01 09:00):
  Market: BTC @ $95,000, RSI=45, trending up
  Decision: WAIT (waiting for momentum confirmation)

Evaluation 2 (2025-01-01 10:00):
  Market: BTC @ $95,500, RSI=55, breakout forming
  Decision: LONG @ $95,500, SL=$93,590, TP=$101,230

Evaluation 3 (2025-01-01 11:00):
  Market: BTC @ $96,200, in profit
  Decision: WAIT (holding position)

... continues until end date or TP/SL hit
```

## Phase 3: Analysis

After backtesting, the AI analyzes the results:

### Metrics Evaluated

| Metric | Description |
|--------|-------------|
| **PnL %** | Total return percentage |
| **Win Rate** | Percentage of winning trades |
| **Sharpe Ratio** | Risk-adjusted return |
| **Max Drawdown** | Largest peak-to-trough decline |
| **Trade Count** | Number of completed trades |

### Performance Feedback

The AI receives structured feedback:

```
Backtest Results:
- PnL: +15.3%
- Win Rate: 58%
- Trades: 24
- Sharpe: 1.8
- Max Drawdown: -8.2%

Analysis: Strategy performs well in trending markets but
struggles during consolidation periods. Consider adding a
filter to avoid ranging markets.
```

## Phase 4: Evolution

Based on analysis, the AI evolves the strategy using different approaches:

### Refinement

Adjust existing parameters:
- Tighten or widen stop losses
- Modify indicator periods
- Change entry/exit thresholds

### Extension

Add new conditions:
- Volume confirmation
- Additional timeframe alignment
- Market regime filters

### Pivot

Try a different approach:
- Switch from trend-following to mean reversion
- Change from breakout entries to pullback entries
- Explore different indicator combinations

### Example Evolution Sequence

**Iteration 1:**
```
"Enter long on RSI oversold bounce"
→ PnL: +5.2%, many false signals
```

**Iteration 2 (Refined):**
```
"Enter long on RSI oversold bounce WITH volume spike"
→ PnL: +12.1%, fewer but better signals
```

**Iteration 3 (Extended):**
```
"Enter long on RSI oversold bounce with volume spike,
confirmed by bullish divergence on 4H timeframe"
→ PnL: +18.7%, high-quality setups
```

## Multi-Timeframe Analysis

Gopher analyzes multiple timeframes simultaneously for better signals:

```
┌─────────────────────────────────────────────────┐
│              Multi-Timeframe Stack               │
├─────────────────────────────────────────────────┤
│ 4H:  Trend direction (primary filter)           │
│ 1H:  Entry setup identification                 │
│ 15m: Entry timing (precision)                   │
└─────────────────────────────────────────────────┘
```

This allows strategies like:
- "Only take long trades when 4H trend is bullish"
- "Enter on 15m signals that align with 1H structure"
- "Use higher timeframe for trend, lower for entry"

## When Evolution Stops

Evolution continues until one of:

- **Max iterations reached**: Your configured limit
- **User intervention**: You click Stop
- **Convergence**: AI determines diminishing improvements

## Best Strategy Selection

The best strategy is determined by a composite score:

```
Score = (PnL × 0.4) + (Sharpe × 0.3) + (WinRate × 0.2) + (1/Drawdown × 0.1)
```

This balances:
- Raw profitability (PnL)
- Risk-adjusted returns (Sharpe)
- Consistency (Win Rate)
- Capital preservation (low Drawdown)

## Monte Carlo Validation

Top strategies undergo statistical validation:

1. **Run N simulations** (typically 100)
2. **Introduce variation**: Slight timing differences, slippage
3. **Calculate statistics**:
   - Mean PnL across all runs
   - Standard deviation
   - 95% confidence interval
   - Probability of profit

### Validation Criteria

A strategy is considered robust if:
- Mean PnL > 0
- 95% confidence interval lower bound > -5%
- Probability of profit > 60%

## Tips for Better Evolution

### 1. Data Quality
- Use assets with high coverage (>90%)
- Include periods with different market conditions
- Longer date ranges = more reliable results

### 2. Configuration
- Start with multiple timeframes (15m + 1h + 4h)
- Use reasonable risk settings (2% per trade)
- Allow enough iterations (50+) for meaningful exploration

### 3. Strategy Prompts
If providing a starting prompt:
- Be specific about conditions
- Include both entry AND exit rules
- Define risk management parameters

### 4. Patience
- Evolution takes time
- Early iterations often underperform
- Best results typically appear mid-to-late in evolution
- Don't stop too early!

## Understanding Results

### Good Signs
- Steadily improving PnL across iterations
- Sharpe ratio > 1.5
- Win rate 50-65% with good R:R
- Reasonable trade frequency (not too many, not too few)

### Warning Signs
- Perfect results (likely overfitting)
- Very high trade count (overtrading)
- High win rate but negative PnL (poor risk management)
- Inconsistent results across Monte Carlo runs

## Next Steps

- [Custom Prompts](/guides/custom-prompts) - Guide the AI with your trading approach
- [Configuration](/guides/configuration) - Fine-tune evolution settings
- [Troubleshooting](/guides/troubleshooting) - Common issues and solutions
- [Data Coverage](/reference/data-coverage) - Available assets and timeframes
