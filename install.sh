#!/bin/bash
# Gopher CLI Installer
# Usage: curl -sSL https://raw.githubusercontent.com/gopher-lab/gopher/main/install.sh | bash

set -e

REPO="gopher-lab/gopher"
BINARY_NAME="gopher"
INSTALL_DIR="${INSTALL_DIR:-/usr/local/bin}"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}"
echo "   ██████   ██████  ██████  ██   ██ ███████ ██████  "
echo "  ██       ██    ██ ██   ██ ██   ██ ██      ██   ██ "
echo "  ██   ███ ██    ██ ██████  ███████ █████   ██████  "
echo "  ██    ██ ██    ██ ██      ██   ██ ██      ██   ██ "
echo "   ██████   ██████  ██      ██   ██ ███████ ██   ██ "
echo -e "${NC}"
echo "  AI-Powered Crypto Trading Strategy Discovery"
echo ""

# Detect OS and architecture
detect_platform() {
    local os arch
    
    case "$(uname -s)" in
        Darwin*)  os="darwin" ;;
        Linux*)   os="linux" ;;
        MINGW*|MSYS*|CYGWIN*) os="windows" ;;
        *)        echo -e "${RED}Unsupported OS: $(uname -s)${NC}"; exit 1 ;;
    esac
    
    case "$(uname -m)" in
        x86_64|amd64)  arch="amd64" ;;
        arm64|aarch64) arch="arm64" ;;
        *)             echo -e "${RED}Unsupported architecture: $(uname -m)${NC}"; exit 1 ;;
    esac
    
    echo "${os}-${arch}"
}

# Get the latest release version (including prereleases)
get_latest_version() {
    curl -sSL "https://api.github.com/repos/${REPO}/releases" | \
        grep '"tag_name":' | head -1 | sed -E 's/.*"([^"]+)".*/\1/'
}

# Main install function
install() {
    local platform version download_url archive_name
    
    platform=$(detect_platform)
    echo -e "${YELLOW}Detected platform:${NC} ${platform}"
    
    echo -e "${YELLOW}Fetching latest version...${NC}"
    version=$(get_latest_version)
    
    if [ -z "$version" ]; then
        echo -e "${RED}Failed to fetch latest version${NC}"
        exit 1
    fi
    
    echo -e "${GREEN}Latest version:${NC} ${version}"
    
    # Construct download URL
    local version_number="${version#v}"  # Remove 'v' prefix
    
    if [ "$platform" = "windows-amd64" ]; then
        archive_name="gopher-${version_number}-${platform}.zip"
    else
        archive_name="gopher-${version_number}-${platform}.tar.gz"
    fi
    
    download_url="https://github.com/${REPO}/releases/download/${version}/${archive_name}"
    
    echo -e "${YELLOW}Downloading:${NC} ${archive_name}"
    
    # Create temp directory
    local tmpdir
    tmpdir=$(mktemp -d)
    cd "$tmpdir"
    
    # Download
    if ! curl -sSL -o "$archive_name" "$download_url"; then
        echo -e "${RED}Download failed${NC}"
        rm -rf "$tmpdir"
        exit 1
    fi
    
    # Extract
    echo -e "${YELLOW}Extracting...${NC}"
    if [[ "$archive_name" == *.zip ]]; then
        unzip -q "$archive_name"
    else
        tar -xzf "$archive_name"
    fi
    
    # Make executable
    chmod +x "$BINARY_NAME"*
    
    # Install
    echo -e "${YELLOW}Installing to ${INSTALL_DIR}...${NC}"
    if [ -w "$INSTALL_DIR" ]; then
        mv "$BINARY_NAME"* "$INSTALL_DIR/"
    else
        echo -e "${YELLOW}Requires sudo for installation${NC}"
        sudo mv "$BINARY_NAME"* "$INSTALL_DIR/"
    fi
    
    # Cleanup
    cd - > /dev/null
    rm -rf "$tmpdir"
    
    # macOS: Remove quarantine attribute
    if [ "$(uname -s)" = "Darwin" ]; then
        xattr -cr "$INSTALL_DIR/$BINARY_NAME" 2>/dev/null || true
    fi
    
    echo ""
    echo -e "${GREEN}Installation complete!${NC}"
    echo ""
    echo -e "Run ${BLUE}gopher --help${NC} to get started"
    echo -e "Run ${BLUE}gopher setup${NC} for interactive configuration"
    echo ""
    
    # Verify
    if command -v gopher &> /dev/null; then
        echo -e "${GREEN}Installed version:${NC}"
        gopher --version 2>/dev/null || echo "  ${version}"
    fi
}

# Run installer
install
