cask "lalia" do
  version "0.1.1"
  sha256 "f52bbb668d602fb2c62c919381f5a81ec2e1688f4f97a4a8a6ca865a839257bf"

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
