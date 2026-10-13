# Homebrew tap for Notch

A Dynamic Island for the MacBook notch — tiles, peeks, persona workspaces and a
Claude Code bridge that can approve or deny tool calls from the notch.

```bash
brew install --cask karthikmprakash/tap/notch
```

`brew install` also links `notch` into your PATH: that is the same binary the app
uses for its Claude Code hooks, so hook commands are just `notch --hook`.

The app is signed ad-hoc, so macOS blocks the first launch. Allow it once:

```bash
xattr -dr com.apple.quarantine /Applications/Notch.app
```

Upstream: https://github.com/karthikmprakash/notch
