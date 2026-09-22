cask "autarky" do
  version "0.1.5"
  sha256 "c716954b3ae4bab04d8c119e4ec30a113010ed3556b6153cdcc9306287bf0039"

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
