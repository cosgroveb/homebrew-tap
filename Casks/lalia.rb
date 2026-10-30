cask "lalia" do
  version "0.3.4"
  sha256 "a13f9c8ae9032cee9c293bb8e4d3aa3ab19fac21c79e269ff26c89ca58079c7b"

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
