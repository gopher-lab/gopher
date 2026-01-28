---
sidebar_position: 4
---

# Custom Strategy Prompts

Guide your AI with custom strategy prompts to focus evolution on specific trading approaches.

## Overview

Custom prompts allow you to provide guidance to the AI when it generates, evolves, and combines trading strategies. Instead of letting the AI explore freely, you can direct it toward specific trading styles, techniques, or approaches that match your preferences.

## How It Works

When you provide a custom strategy prompt, it flows through the entire system:

```
┌──────────────────────────────────────────────────────────────────┐
│                 Custom Prompt Propagation                        │
│                                                                  │
│   ┌─────────────┐                                               │
│   │  Your       │                                               │
│   │  Custom     │                                               │
│   │  Prompt     │                                               │
│   └──────┬──────┘                                               │
│          │                                                      │
│          ▼                                                      │
│   ┌─────────────┐     ┌─────────────┐     ┌─────────────┐      │
│   │  Agent      │────▶│  generate   │────▶│  evolve     │      │
│   │  System     │     │  _strategy  │     │  _prompt    │      │
│   │  Prompt     │     │             │     │             │      │
│   └─────────────┘     └─────────────┘     └─────────────┘      │
│                              │                   │               │
│                              ▼                   ▼               │
│                       ┌─────────────────────────────┐           │
│                       │  Strategies aligned with    │           │
│                       │  your trading approach      │           │
│                       └─────────────────────────────┘           │
└──────────────────────────────────────────────────────────────────┘
```

Your custom prompt is:

1. **Included in the agent's system prompt** - The AI sees your guidance as a core instruction
2. **Passed to strategy generation** - New strategies incorporate your approach
3. **Used during evolution** - Improvements maintain alignment with your guidance
4. **Applied to crossover** - Combined strategies still follow your direction

## Using Custom Prompts

### In the Desktop App

1. Go to **Settings** → **Trading** section
2. Enter your prompt in the **Default Strategy Prompt** field
3. This becomes the default for all evolution runs

Or override per-run:

1. Go to **Evolution** tab
2. Enter your prompt in the **Strategy Prompt** field
3. Click **Start Evolution**

### In the CLI

```bash
# For evolution runs
gopher evolve --asset BTC --prompt "Focus on momentum breakouts with RSI confirmation"

# For direct backtests
gopher backtest --asset BTC --prompt "Trade breakouts above 20-period highs with volume confirmation"

# For Monte Carlo validation
gopher montecarlo --asset ETH --prompt "Mean reversion at Bollinger Band extremes" --runs 100
```

## Writing Effective Prompts

### Good Prompts Are Specific

**Good:**
```
Focus on momentum breakouts. Enter long when price breaks above the 20-period 
high with RSI above 55. Enter short when price breaks below the 20-period low 
with RSI below 45. Use 2% stops and target 3:1 reward-to-risk.
```

**Bad:**
```
Make money trading crypto.
```

### Include Key Elements

A well-structured prompt should cover:

1. **Trading style** - Momentum, mean-reversion, trend-following, etc.
2. **Entry conditions** - What triggers a trade
3. **Direction bias** - Long-only, short-only, or both
4. **Risk parameters** - Stop loss, take profit preferences
5. **When to wait** - Conditions where no trade is appropriate

### Example Prompts

#### Momentum Breakout Strategy
```
Focus on momentum breakouts with volume confirmation. Enter long when price 
breaks above recent resistance with RSI above 50 and volume 1.5x average. 
Enter short on breakdown below support with RSI below 50. Use tight stops 
at 1.5% and let winners run with trailing stops.
```

#### Mean Reversion Strategy
```
Trade mean reversion at extremes. Enter long when RSI drops below 30 and 
price touches lower Bollinger Band. Enter short when RSI exceeds 70 and 
price touches upper Bollinger Band. Target return to the 20-period moving 
average. Use 2% maximum stop loss.
```

#### Trend Following Strategy
```
Follow the trend using multiple timeframes. Only trade in the direction of 
the 4H trend. Enter on pullbacks to the 20 EMA when 1H RSI shows momentum 
alignment. Never counter-trend trade. Use wide 3% stops to avoid noise 
and target 2:1 minimum reward-to-risk.
```

#### Conservative Low-Frequency Strategy
```
Wait for high-probability setups only. Require confluence of at least 3 
signals: trend alignment, RSI confirmation, and key level breakout. 
Maximum 1-2 trades per day. Prioritize win rate over frequency. 
Use strict 1.5% stops and minimum 2:1 targets.
```

## Prompt Limits

- **Maximum length**: 2,000 characters
- Prompts are stored with each session for reproducibility
- Prompts are visible in the History view

## How Prompts Affect Evolution

### Without Custom Prompt

The AI explores freely, generating diverse strategies based on:
- Asset characteristics (volatility, trend)
- Market conditions
- General trading best practices

### With Custom Prompt

The AI constrains its exploration to strategies that:
- Match your specified trading style
- Use your preferred entry/exit conditions
- Follow your risk management guidelines

This typically leads to:
- More consistent strategy themes
- Faster convergence on your preferred approach
- Results that align with your trading philosophy

## Best Practices

1. **Start broad, then narrow** - Begin with general guidance, refine based on results
2. **Be consistent** - Conflicting instructions confuse the AI
3. **Include what NOT to do** - "Never counter-trend trade" is valuable guidance
4. **Reference indicators** - The AI understands RSI, MACD, Bollinger Bands, etc.
5. **Specify timeframe preferences** - "Focus on 4H charts" if relevant

## Troubleshooting

### Strategies Don't Match My Prompt

- Check the prompt is under 2,000 characters
- Ensure the prompt is specific enough
- Review the History to confirm the prompt was saved

### AI Ignores Parts of My Prompt

- Simplify conflicting instructions
- Prioritize your most important guidance
- Use clearer, more direct language

### Too Few Trades Generated

Your prompt may be too restrictive. Try:
- Loosening entry conditions
- Allowing both long and short trades
- Reducing the number of required confirmations

## Related Guides

- [Strategy Evolution](./strategy-evolution.md) - How the evolution loop works
- [Configuration](./configuration.md) - All configuration options
- [Troubleshooting](./troubleshooting.md) - Common issues and solutions
