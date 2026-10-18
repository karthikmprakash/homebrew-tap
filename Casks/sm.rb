cask "sm" do
  version "0.5.1"
  sha256 "9141951eb9f16373149017f16f8361fec3d17b2ce67e5c3ceac1b60d1449ee65"

  url "https://github.com/karthikmprakash/agents-secret-manager/releases/download/v#{version}/sm-macos-app.zip",
      verified: "github.com/karthikmprakash/agents-secret-manager/"
  name "sm"
  desc "Local encrypted secrets for AI coding agents"
  homepage "https://karthikmprakash.github.io/agents-secret-manager/"

  depends_on macos: ">= :ventura"

  app "sm.app"
  binary "sm"

  uninstall quit: "com.karthikmprakash.sm"

  zap trash: [
    "~/Library/WebKit/com.karthikmprakash.sm",
  ]

  caveats <<~EOS
    sm starts locked. Create a desktop passphrase on first launch; Touch ID
    unlocks it on supported Macs. The CLI and MCP are not gated by the app lock.

    This build is not notarized. If macOS blocks it, right-click sm.app once or:
      xattr -d com.apple.quarantine /Applications/sm.app
  EOS
end
