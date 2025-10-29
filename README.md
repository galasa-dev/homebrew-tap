# Galasa Homebrew Tap

This repository contains Homebrew casks for the Galasa Command-Line interface (galasactl).

## Copyright

Copyright contributors to the Galasa project  
SPDX-License-Identifier: EPL-2.0

## How do I install these casks?

You can install the Galasa Command-Line interface using one of the following methods:

### Method 1: Direct install

```bash
brew install galasa-dev/tap/galasactl --no-quarantine
```

### Method 2: Tap and install

```bash
brew tap galasa-dev/tap
brew install --no-quarantine galasactl
```

## Available Versions

### Latest Version

To install the latest version:

```bash
brew install --no-quarantine galasactl
```

### Specific Version

To install a specific version:

```bash
brew install --no-quarantine galasactl@x.xx.x
```

For example:

```bash
brew install --no-quarantine galasactl@0.44.0
```

> **Note:** The `--no-quarantine` flag is currently required because otherwise it's not possible to run the galasactl binary. See documentation about this at [https://galasa.dev](https://galasa.dev).

## Supported Architectures

The Galasa Command-Line interface supports the following architectures:
- Apple Silicon (arm64)
- Intel-based Macs (x86_64)

## For Maintainers: Releasing a New Version

### Adding a New Version

Use the helper script `add-version.sh` to add a new version:

```bash
./add-version.sh --version x.xx.x
```

For example:

```bash
./add-version.sh --version 0.44.0
```

This will:
1. Download the new version binaries from GitHub
2. Calculate the SHA256 checksums
3. Create a new cask file for the specific version (`Casks/g/galasactl@x.xx.x.rb`)
4. Update the latest version cask file (`Casks/g/galasactl.rb`)
5. Update the example in this README