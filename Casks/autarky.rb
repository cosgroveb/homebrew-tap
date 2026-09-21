cask "autarky" do
  version "0.1.4"
  sha256 "dd5730552c749e749c435f1e8eb54587eb7d0351e928ad4b6611a84ff1fde817"

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
