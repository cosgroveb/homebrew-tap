cask "lalia" do
  version "0.3.2"
  sha256 "1814d1d1026d7a369d1db58f0e80017a2cad74f4586c3ebad280d7d5b46ef6dc"

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
