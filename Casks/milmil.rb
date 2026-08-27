cask "milmil" do
  version "0.1.20"
  sha256 "459978006508425b617643927dd949dba3507bb0f640c26f67b1b539ceeb7e96"

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
    milmil is ad-hoc signed and not notarized. On first launch macOS will
    block it; either reinstall with

      brew install --cask --no-quarantine milmil-dev/milmil/milmil

    or right-click milmil.app and choose Open (on newer macOS:
    System Settings > Privacy & Security > Open Anyway).
  EOS
end
