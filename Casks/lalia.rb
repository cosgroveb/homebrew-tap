cask "lalia" do
  version "0.3.8"
  sha256 "146a9b889b2a0b1d1d61b25995fba71325a3e8e5b96531c7fcbf4d2966f9ebcc"

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
