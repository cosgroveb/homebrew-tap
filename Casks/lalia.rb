cask "lalia" do
  version "0.3.9"
  sha256 "f5acd1acb5b9a5f63feeb4a6d10acdfe759731be102b20a80e21f76a44552e00"

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
