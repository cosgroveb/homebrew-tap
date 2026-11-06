cask "lalia" do
  version "0.3.11"
  sha256 "434b54b78b46a01de1386cfb74c6b7a1d50dba670ededf9e79892023f1d10caa"

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
