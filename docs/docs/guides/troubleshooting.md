---
sidebar_position: 4
---

# Troubleshooting

Solutions to common issues with Gopher.

## Installation Issues

### macOS: "App is damaged and can't be opened"

This happens when macOS quarantine flags aren't cleared.

**Solution:**

```bash
xattr -cr /Applications/Gopher.app
```

Then try opening the app again.

### macOS: "Cannot be opened because the developer cannot be verified"

This is expected for unsigned applications.

**Solution:**

1. Right-click (or Control-click) the app
2. Select **Open** from the context menu
3. Click **Open** in the dialog

After this one-time step, you can open normally.

### Windows: SmartScreen blocks installation

**Solution:**

1. Click **More info**
2. Click **Run anyway**

This is normal for new applications without an EV code signing certificate.

### Windows: "WebView2 Runtime required"

**Solution:**

Download and install [WebView2 Runtime](https://developer.microsoft.com/en-us/microsoft-edge/webview2/) from Microsoft.

Most Windows 10/11 systems have this pre-installed.

## API Key Issues

### "API key not working" / "Authentication failed"

**Check these:**

1. **No extra spaces**: Copy the key exactly, without leading/trailing spaces
2. **Correct field**: OpenRouter keys go in OpenRouter field, OpenAI keys in OpenAI field
3. **Valid key**: Check your provider dashboard to ensure the key is active
4. **Credits available**: Ensure your account has API credits

**Test the connection:**

Click the **Test** button next to the API key field to verify.

### "Rate limit exceeded"

You've made too many API requests in a short period.

**Solutions:**

1. Wait a few minutes and try again
2. Reduce **Max Tool Calls per Iteration** in settings
3. Upgrade your API plan for higher limits

### "Insufficient credits" / "Quota exceeded"

Your API account has run out of credits.

**Solutions:**

1. Add credits to your OpenRouter/OpenAI account
2. Switch to a different API provider
3. Use a more cost-efficient model

## Evolution Issues

### Evolution stuck / not progressing

**Possible causes:**

1. **API issues**: Check your API key and credits
2. **Network problems**: Verify internet connection
3. **Model overload**: The LLM provider may be experiencing high load

**Solutions:**

1. Check the Activity Log for error messages
2. Stop and restart the evolution
3. Try a different model
4. Wait and try again later

### "No data available" / "Coverage too low"

The selected asset doesn't have enough historical data.

**Solutions:**

1. Select a different asset (BTC, ETH have the most data)
2. Reduce the date range
3. Check [Data Coverage](/reference/data-coverage) for available assets

### Poor backtest results

**Common causes:**

1. **Too short date range**: Use at least 14 days for meaningful results
2. **Poor data coverage**: Aim for >90% coverage
3. **Not enough iterations**: Allow 50+ iterations for good exploration
4. **Wrong timeframes**: Match timeframes to your trading style

**Tips:**

- Use multiple timeframes (e.g., 15m + 1h + 4h)
- Start with major assets (BTC, ETH) which have better data
- Don't stop evolution too early

### Evolution completes but no good strategies found

**Solutions:**

1. Increase max iterations (try 100)
2. Try different timeframe combinations
3. Provide a strategy prompt to guide the AI
4. Test with a different date range (different market conditions)

## Connection Issues

### "Failed to connect to data service"

**Solutions:**

1. Check your internet connection
2. Try again in a few minutes (service may be temporarily unavailable)
3. Check [GitHub Issues](https://github.com/gopher-lab/gopher/issues) for known outages

### "Database connection failed" (Local Database)

If using a local PostgreSQL database:

1. Verify PostgreSQL is running
2. Check the connection string format:
   ```
   postgresql://user:password@localhost:5432/database
   ```
3. Ensure your IP is allowed (if using remote database)
4. Test connection manually:
   ```bash
   psql "postgresql://user:pass@host:port/database"
   ```

## Performance Issues

### App is slow / unresponsive

**Solutions:**

1. Close other resource-intensive applications
2. Reduce the number of timeframes selected
3. Use a smaller date range
4. Check Activity Log for errors

### High CPU usage during backtests

This is normal - backtesting is computationally intensive.

**To reduce load:**

1. Reduce evaluation interval (15m instead of 5m)
2. Use fewer timeframes
3. Reduce Monte Carlo runs

### High API costs

**Solutions:**

1. Use more cost-efficient models (e.g., `gpt-4o-mini` instead of `gpt-4`)
2. Reduce max iterations
3. Reduce max tool calls per iteration
4. Monitor usage in your provider dashboard

## Data Issues

### Missing candles / gaps in data

Some gaps in 1-minute data are normal - they occur when no trades happened.

**For significant gaps:**

1. Try a different asset
2. Use higher timeframes (1h, 4h have better coverage)
3. Adjust date range to avoid gap periods

### "Asset not found"

The requested trading pair isn't available.

**Solutions:**

1. Check spelling (use uppercase: BTC, not btc)
2. Verify the asset is in [supported assets list](/reference/data-coverage)
3. Use the asset search/dropdown in the UI

## CLI Issues

### "Command not found: gopher"

The binary isn't in your PATH.

**Solutions:**

1. Use the full path: `./gopher` or `/path/to/gopher`
2. Add to PATH:
   ```bash
   export PATH="$PATH:/path/to/gopher"
   ```
3. Move to a PATH directory:
   ```bash
   sudo mv gopher /usr/local/bin/
   ```

### Environment variables not working

**Check:**

1. Variables are exported (not just set):
   ```bash
   export OPENROUTER_API_KEY='...'  # Correct
   OPENROUTER_API_KEY='...'         # Won't work in subprocesses
   ```
2. Quotes are correct (single quotes for special characters)
3. No extra spaces

## Getting Help

If you can't resolve your issue:

1. **Check existing issues**: [GitHub Issues](https://github.com/gopher-lab/gopher/issues)
2. **Report a bug**: Include:
   - Your OS and version
   - Gopher version
   - Steps to reproduce
   - Error messages from Activity Log
3. **Contact support**: [hello@gopher-ai.com](mailto:hello@gopher-ai.com)

## Next Steps

- [Configuration](/guides/configuration) - Review your settings
- [Data Coverage](/reference/data-coverage) - Check available assets
- [Models](/reference/models) - Try different LLM models
