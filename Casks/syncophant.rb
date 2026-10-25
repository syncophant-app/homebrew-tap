cask "syncophant" do
  version "0.1.0"
  sha256 "23995be90ab1449b4dd8669411f905b6c78f9e2ecbe2421e0b1e242c28d6e376"

  url "https://github.com/syncophant-app/macos/releases/download/v#{version}/Syncophant-#{version}-arm64.zip"
  name "Syncophant"
  desc "Mount your own cloud storage in Finder"
  homepage "https://syncophant.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Syncophant.app"

  uninstall quit: "app.syncophant.mac"

  zap trash: [
    "~/Library/Group Containers/group.app.syncophant.mac",
    "~/Library/Group Containers/group.app.syncophant.mac.ssh",
    "~/Library/Preferences/app.syncophant.mac.plist",
  ]
end
