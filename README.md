# Homebrew Taps

This repository contains Homebrew formulas for custom packages.

## Available Formulas

### simple-smtp-mailer

High-performance SMTP mailer with queue management and OAuth2 support.

#### Installation

Add this tap to your Homebrew installation:

```bash
brew tap blburns/tap
```

Then install simple-smtp-mailer:

```bash
# Install stable release
brew install blburns/tap/simple-smtp-mailer

# Install edge/development version
brew install --HEAD blburns/tap/simple-smtp-mailer
```

#### Features

- High-performance SMTP mailer
- Queue management
- OAuth2 authentication support
- Multi-provider API support (SendGrid, Mailgun, Amazon SES, etc.)
- JSON, YAML, and INI configuration formats
- OAuth2 helper tools for easy setup

#### Dependencies

The formula automatically installs the following dependencies:

**Build Dependencies:**
- `cmake` - Build system
- `pkg-config` - Package configuration
- `googletest` - Testing framework (optional, for tests)

**Runtime Dependencies:**
- `openssl@3` - SSL/TLS support
- `jsoncpp` - JSON parsing
- `curl` - HTTP client library
- `yaml-cpp` - YAML configuration parsing
- `python@3.9` (or higher) - Python 3.9+ for OAuth2 helper tools

**Python Packages:**
- `requests` - Installed automatically for OAuth2 helper tools

#### Python Version Support

The formula supports Python 3.9 through 3.14. It automatically detects and uses the highest available Python version installed on your system, with a fallback to Python 3.9.

#### Usage

After installation, you can use `simple-smtp-mailer`:

```bash
# Check version
simple-smtp-mailer --version

# Show help
simple-smtp-mailer --help

# Send an email
simple-smtp-mailer send --from user@example.com --to recipient@example.com --subject "Test" --body "Hello"

# Test SMTP connection
simple-smtp-mailer test

# Use OAuth2 helper tools
python3 tools/oauth2-helper/oauth2-helper.py gmail
```

#### Configuration

Configuration files are installed to:
- `/usr/local/etc/simple-smtp-mailer/` (Intel Macs)
- `/opt/homebrew/etc/simple-smtp-mailer/` (Apple Silicon Macs)

Example configuration files are provided in the `config/` directory.

#### Updating

To update to the latest version:

```bash
brew update
brew upgrade blburns/tap/simple-smtp-mailer
```

#### Troubleshooting

**Permission Errors:**
The formula is designed to install without requiring sudo/root permissions. If you encounter permission errors, ensure you're not running Homebrew with sudo.

**Python Package Issues:**
Python packages (like `requests`) are installed to the formula's own lib directory. If OAuth2 helper tools can't find Python packages, ensure you're using the correct Python version and that the packages are installed.

**Service File Installation:**
The launchd service file is not automatically installed (to avoid requiring root permissions). If you need to run simple-smtp-mailer as a service, you can manually install the service file from the deployment directory.

#### Uninstallation

To remove simple-smtp-mailer:

```bash
brew uninstall blburns/tap/simple-smtp-mailer
```

#### Documentation

For more detailed documentation, visit the [simple-smtp-mailer repository](https://github.com/blburns/simple-smtp-mailer).

#### License

Apache-2.0
