cask "milmil" do
  version "0.1.21"
  sha256 "22192ac3595b13b472a537aae2975c66737a9f56840fb1af8698bab1b90816dd"

  url "https://github.com/milmil-dev/milmil/releases/download/v#{version}/milmil-macos-#{version}.dmg"
  name "milmil"
  desc "Client for the milmil self-hosted anime media server"
  homepage "https://github.com/milmil-dev/milmil"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "milmil.app"

  zap trash: [
    "~/Library/Application Support/milmil",
    "~/Library/Caches/dev.milmil.macos",
    "~/Library/HTTPStorages/dev.milmil.macos",
    "~/Library/Preferences/dev.milmil.macos.plist",
    "~/Library/Saved Application State/dev.milmil.macos.savedState",
  ]

  caveats <<~EOS
    milmil is ad-hoc signed and not notarized, so macOS blocks the first
    launch. Right-click milmil.app and choose Open (on newer macOS:
    System Settings > Privacy & Security > Open Anyway), or clear the flag
    yourself:

      xattr -d com.apple.quarantine /Applications/milmil.app

    Homebrew's --no-quarantine option was removed in Homebrew 6.
  EOS
end
