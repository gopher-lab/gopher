---
sidebar_position: 3
---

# Indicators

Indicators drive all analysis in Gopher. The same indicator set is used in:

- Single backtests
- Strategy evolution
- Monte Carlo validation
- Live trading (from the selected strategy/backtest)

This page explains how to configure indicators across the UI and CLI.

## Supported Indicators

Built-in indicators are grouped by category:

| Category | Indicators |
|----------|------------|
| Trend | `sma`, `ema`, `mma`, `trendline`, `aroon_up`, `aroon_down` |
| Momentum | `rsi`, `macd`, `cci`, `relative_strength`, `rvi` |
| Volatility | `bollinger`, `atr`, `keltner`, `std_dev`, `variance`, `true_range` |
| Oscillators | `stochastic_fast`, `stochastic_slow` |
| Volume | `volume` |
| Statistical | `mean_deviation`, `max_value`, `min_value`, `max_drawdown`, `typical_price` |

The desktop app shows all available indicators and their parameters in the selector UI.

## Parameter Reference (Defaults)

Use these parameter keys in config files:

| Indicator | Parameters | Defaults |
|----------|------------|----------|
| `sma` | `sma.period` | 50 |
| `ema` | `ema.period` | 12 |
| `mma` | `mma.period` | 20 |
| `rsi` | `rsi.period` | 14 |
| `macd` | `macd.fast_period`, `macd.slow_period`, `macd.signal_period` | 12 / 26 / 9 |
| `bollinger` | `bollinger.period`, `bollinger.multiplier` | 20 / 2 |
| `atr` | `atr.period` | 14 |
| `cci` | `cci.period` | 20 |
| `stochastic_fast` | `stochastic.period`, `stochastic.smooth_period` | 14 / 3 |
| `stochastic_slow` | `stochastic.period`, `stochastic.smooth_period` | 14 / 3 |
| `aroon_up` | `aroon.period` | 14 |
| `aroon_down` | `aroon.period` | 14 |
| `keltner` | `keltner.period`, `keltner.multiplier` | 20 / 2 |
| `trendline` | `trendline.period` | 20 |
| `relative_strength` | `relative_strength.period` | 14 |
| `rvi` | `rvi.period` | 10 |
| `std_dev` | `std_dev.period` | 20 |
| `variance` | `variance.period` | 20 |
| `mean_deviation` | `mean_deviation.period` | 20 |
| `max_value` | `max_value.period` | 20 |
| `min_value` | `min_value.period` | 20 |
| `max_drawdown` | `max_drawdown.period` | 50 |
| `volume` | `window.period` | 20 |
| `typical_price` | none | n/a |

## Desktop UI (Backtest, Evolution, Monte Carlo)

Indicators are configured per run:

1. Open **Backtest**, **Evolution**, or **Monte Carlo**
2. Scroll to **Indicators**
3. Toggle indicators on/off
4. Adjust parameters (periods, multipliers, smoothing, etc.)
5. Run the job

The selected indicator set is stored with results and reused for live trading.

## Presets

Indicator selections are part of presets. When you save a preset in the Evolution tab, the indicator set is saved and restored with it.

## CLI: Manual Live Trading

Manual live trading supports indicator and interval overrides via `traders.yaml` or CLI flags.

### `traders.yaml` example

```yaml
traders:
  - id: "trader-1"
    private_key_env: "TRADER_1_PRIVATE_KEY"
    capital: 1000.0
    asset: "BTC"
    model_id: "qwen/qwen3-vl-8b-instruct"
    eval_interval: 5m
    leverage: 10
    intervals: ["15m", "1h", "4h"]
    indicators:
      - type: "sma"
        enabled: true
        sma:
          period: 50
      - type: "rsi"
        enabled: true
        rsi:
          period: 14
      - type: "bollinger"
        enabled: true
        bollinger:
          period: 20
          multiplier: 2
```

### CLI flags (manual mode only)

```bash
gopher live \
  --config traders.yaml \
  --mode paper \
  --intervals "15m,1h,4h" \
  --indicators ./indicators.yaml
```

Notes:

- `--intervals` and `--indicators` are ignored when `--orchestrator` is enabled.
- If no overrides are provided, defaults are used.

### Indicators file format

The `--indicators` file is a list of `EnabledIndicator` objects in JSON or YAML.

```yaml
- type: "macd"
  enabled: true
  macd:
    fast_period: 12
    slow_period: 26
    signal_period: 9
- type: "atr"
  enabled: true
  atr:
    period: 14
```

## Custom Indicators (Developers)

Developers can register custom indicators in Go via the indicator registry. This is a code-level extension point; the UI reads the registered catalog at runtime.

## Related Docs

- [Configuration](/guides/configuration) - Full settings reference
- [Strategy Evolution](/guides/strategy-evolution) - How indicators are used during evolution
