cask "milmil" do
  version "0.1.19"
  sha256 "801640928680d9c1a916d1692913dbff2d564cb24e08c34da5eb81d1168732c2"

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
