# Galasa Tap

## How do I install these casks?

`brew install galasa-dev/tap/<cask>`

Or `brew tap galasa-dev/tap` and then `brew install --no-quarantine <cask>`.

## Casks
Currently different version of casks for the Galasa Command-Line interface (galasactl).  To install the latest version use the following command

```
brew install --no-quarantine galasactl
```

for a specific version use

```
brew install --no-quarantine galasactl@x.xx.x
```
for example
```
brew install --no-quarantine galasactl@0.40.0
```

At the moment the --no-quarantine is required because otherwise its not possible to run the galasactl. See documentation about this at 
https://galasa.dev.

## For maintainers: Releaseing a new version
Use the helper script `add-version.sh`

For example:
```bash
./add-version.sh --version 0.40.0
```

The file Cask/g/galasactl.rb will be updated with that version, so people can get that as the latest version.
An extra formula will be added for that version specifically also. 
