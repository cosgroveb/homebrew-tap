cask "autarky" do
  version "0.1.6"
  sha256 "2f8e9d7cd9e5666b1a3e381d546604edc3c106eb7495cb3a0066f4bbb5ea618a"

  url "https://downloads.writeaheadblogg.ing/autarky/v#{version}/Autarky-#{version}-arm64.dmg"
  name "Autarky"
  desc "Debian shell VM with local Gemma assistance"
  homepage "https://downloads.writeaheadblogg.ing/autarky/v#{version}/index.html"

  livecheck do
    skip "Updated by the release workflow"
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Autarky.app"
end
