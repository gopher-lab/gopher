---
sidebar_position: 2
---

# Windows Installation

Download and install Gopher on Windows.

## System Requirements

- **Windows**: 10 (version 1809+) or Windows 11
- **Processor**: x64 (64-bit)
- **Memory**: 4 GB RAM minimum
- **Storage**: 200 MB available space
- **Runtime**: WebView2 (usually pre-installed on Windows 10/11)

## Download

1. Go to the [Releases page](https://github.com/gopher-lab/gopher/releases)
2. Download the latest `Gopher-X.X.X-Setup.exe` installer

## Install

1. **Run the installer** - Double-click `Gopher-X.X.X-Setup.exe`
2. **Accept prompts** - If Windows SmartScreen appears, click "More info" then "Run anyway"
3. **Follow the wizard** - Choose installation location and complete setup
4. **Launch** - Gopher will be available in the Start menu

## Windows SmartScreen Warning

Since Gopher is not signed with an EV certificate, Windows may show a SmartScreen warning.

### How to Proceed

1. Click **More info** on the warning dialog
2. Click **Run anyway**

This is a one-time prompt for new applications.

## Portable Installation

If you prefer not to use the installer:

1. Download `Gopher-X.X.X-windows-amd64.zip` from Releases
2. Extract to your preferred location
3. Run `Gopher.exe` directly

Note: The portable version won't create Start menu shortcuts.

## Troubleshooting

### "Windows protected your PC" (SmartScreen)

Click "More info" → "Run anyway". This appears for new, unsigned applications.

### "WebView2 Runtime is required"

Download and install [WebView2 Runtime](https://developer.microsoft.com/en-us/microsoft-edge/webview2/) from Microsoft.

Most Windows 10/11 systems have this pre-installed.

### App doesn't start / blank window

1. Ensure WebView2 is installed
2. Try running as Administrator
3. Check if antivirus is blocking the app
4. [Report the issue](https://github.com/gopher-lab/gopher/issues) with your Windows version

### Antivirus blocking installation

Some antivirus software may flag new applications. You can:

1. Temporarily disable real-time protection during installation
2. Add Gopher to your antivirus whitelist
3. Download from GitHub releases (official source)

## Uninstall

### Via Settings

1. Open **Settings** > **Apps** > **Apps & features**
2. Find **Gopher** in the list
3. Click **Uninstall**

### Via Control Panel

1. Open **Control Panel** > **Programs** > **Uninstall a program**
2. Find **Gopher** and double-click to uninstall

### Remove Settings (Optional)

After uninstalling, remove user data:

```powershell
Remove-Item -Recurse "$env:USERPROFILE\Documents\Gopher"
Remove-Item -Recurse "$env:APPDATA\Gopher"
```

## Next Steps

- [Quick Start Guide](/guides/quickstart) - Run your first strategy evolution
- [Configuration](/guides/configuration) - Set up API keys and preferences
