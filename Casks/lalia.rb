cask "lalia" do
  version "0.1.2"
  sha256 "f5efc6d77c67f65ceff46b0a2efd4280bb1eaca53ee8afdffd94197ea45f6ed1"

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
