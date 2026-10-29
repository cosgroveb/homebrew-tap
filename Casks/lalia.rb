cask "lalia" do
  version "0.3.1"
  sha256 "3902d4f893a54d92e016bf6c09d863e02a6e2b662acc3a298aab15a89c835ec1"

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
