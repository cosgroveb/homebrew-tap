cask "lalia" do
  version "0.3.0"
  sha256 "367e774c534e580ee9424b16232cd773bee607a5a6b86170cb6ea292f59d9ecc"

  url "https://github.com/cosgroveb/lalia/releases/download/v#{version}/Lalia-#{version}.dmg"
  name "Lalia"
  desc "Menu-bar voice dictation"
  homepage "https://github.com/cosgroveb/lalia"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Lalia.app"
end
