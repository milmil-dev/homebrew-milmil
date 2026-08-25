# milmil Homebrew tap

Casks for [milmil](https://github.com/milmil-dev/milmil), the self-hosted
anime media server.

## macOS client

```sh
brew install --cask milmil-dev/milmil/milmil
```

The app is ad-hoc signed (not notarized), so macOS quarantines it on first
launch. Either install with `--no-quarantine`:

```sh
brew install --cask --no-quarantine milmil-dev/milmil/milmil
```

or right-click the app in /Applications and choose **Open** the first time
(on newer macOS: System Settings › Privacy & Security › **Open Anyway**).

The cask is updated automatically by the release workflow in the main
repository — don't edit `version`/`sha256` by hand.
