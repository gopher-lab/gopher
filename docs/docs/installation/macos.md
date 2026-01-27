---
sidebar_position: 1
---

# macOS Installation

Download and install Gopher on your Mac.

## System Requirements

- **macOS**: 11.0 (Big Sur) or later
- **Processor**: Apple Silicon (M1/M2/M3) or Intel
- **Memory**: 4 GB RAM minimum
- **Storage**: 200 MB available space

## Download

1. Go to the [Releases page](https://github.com/gopher-lab/gopher/releases)
2. Download the latest `Gopher-X.X.X-macOS.dmg` file

The macOS build is a universal binary that works on both Apple Silicon (M1/M2/M3) and Intel Macs.

## Install

1. **Open the DMG** - Double-click the downloaded `.dmg` file
2. **Drag to Applications** - Drag the Gopher icon to your Applications folder
3. **Eject** - Right-click the mounted disk and select "Eject"

## First Launch

Since Gopher is not notarized by Apple, macOS will show a security warning on first launch.

### Option 1: Right-Click to Open (Recommended)

1. Open **Finder** and navigate to **Applications**
2. **Right-click** (or Control-click) on **Gopher**
3. Select **Open** from the context menu
4. Click **Open** in the dialog that appears

After this, you can launch Gopher normally.

### Option 2: Allow in Security Settings

1. Try to open Gopher normally
2. When blocked, open **System Preferences** > **Security & Privacy**
3. Click **Open Anyway** next to the Gopher message
4. Click **Open** in the confirmation dialog

## Troubleshooting

### "Gopher is damaged and can't be opened"

This happens when macOS quarantine flags aren't cleared. Fix it with Terminal:

```bash
xattr -cr /Applications/Gopher.app
```

Then try opening the app again.

### "Gopher can't be opened because Apple cannot check it for malicious software"

Follow the [First Launch](#first-launch) instructions above to bypass Gatekeeper.

### App doesn't launch / crashes immediately

1. Make sure you have macOS 11.0 or later
2. Try removing and re-downloading the DMG
3. Check Console.app for crash logs
4. [Report the issue](https://github.com/gopher-lab/gopher/issues) with your macOS version

## Uninstall

1. Quit Gopher if it's running
2. Drag **Gopher.app** from Applications to Trash
3. Optionally, remove settings:
   ```bash
   rm -rf ~/Documents/Gopher
   rm -rf ~/Library/Application\ Support/Gopher
   ```

## Next Steps

- [Quick Start Guide](/guides/quickstart) - Run your first strategy evolution
- [Configuration](/guides/configuration) - Set up API keys and preferences
