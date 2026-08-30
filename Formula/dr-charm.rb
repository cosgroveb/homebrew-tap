class DrCharm < Formula
  desc "DragonRealms terminal client"
  homepage "https://github.com/cosgroveb/dr-charm"
  version "0.0.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cosgroveb/dr-charm/releases/download/v0.0.4/dr-charm_0.0.4_darwin_arm64.tar.gz"
      sha256 "d60c5f7ba434f7b2a91114a56dec0a6840d81d907d361550cfbe97ab31453000"
    end

    on_intel do
      url "https://github.com/cosgroveb/dr-charm/releases/download/v0.0.4/dr-charm_0.0.4_darwin_amd64.tar.gz"
      sha256 "b2adae7df0d311fb1adcb18d8f585481267a1c07e0f9e3e153a2be7dda3f9fb1"
    end
  end

  def install
    bin.install "dr-charm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dr-charm --version")
  end
end
