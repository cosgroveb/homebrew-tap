cask "lalia" do
  version "0.3.10"
  sha256 "7b1eaa4231a78d3eccb0904a816fe3320f531652e412642cb794802d6401516a"

  url "https://github.com/cosgroveb/lalia/releases/download/v#{version}/Lalia-#{version}.dmg"
  name "Lalia"
  desc "Menu-bar voice dictation"
  homepage "https://github.com/cosgroveb/lalia"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on formula: "cosgroveb/tap/lalia-runtime"
  depends_on macos: :tahoe

  app "Lalia.app"
end
