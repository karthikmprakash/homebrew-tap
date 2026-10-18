cask "sm" do
  version "0.5.1"
  sha256 "9141951eb9f16373149017f16f8361fec3d17b2ce67e5c3ceac1b60d1449ee65"

  url "https://github.com/karthikmprakash/agents-secret-manager/releases/download/v#{version}/sm-macos-app.zip"
  name "sm"
  desc "Local encrypted secrets for AI coding agents"
  homepage "https://karthikmprakash.github.io/agents-secret-manager/"

  depends_on macos: :ventura

  app "sm.app"
  binary "sm"

  uninstall quit: "com.karthikmprakash.sm"

  zap trash: [
    "~/Library/WebKit/com.karthikmprakash.sm",
  ]

  # Releases are ad-hoc signed, not notarized. Clearing the quarantine flag
  # lets the app and CLI start normally; remove this once releases are
  # notarized.
  postflight_steps do
    run "/bin/sh",
        args: ["-c", "xattr -dr com.apple.quarantine /Applications/sm.app 2>/dev/null || true"]
    run "/bin/sh",
        args: ["-c", "xattr -d com.apple.quarantine #{HOMEBREW_PREFIX}/bin/sm 2>/dev/null || true"]
  end

  caveats <<~EOS
    sm starts locked. Create a desktop passphrase on first launch; Touch ID
    unlocks it on supported Macs. The CLI and MCP are not gated by the app lock.

    This build is not notarized. Homebrew clears the quarantine attribute so the
    app and CLI open normally; review the source before trusting it.
  EOS
end
