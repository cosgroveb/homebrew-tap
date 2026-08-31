class DrCharm < Formula
  desc "DragonRealms terminal client"
  homepage "https://github.com/cosgroveb/dr-charm"
  version "0.0.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cosgroveb/dr-charm/releases/download/v0.0.5/dr-charm_0.0.5_darwin_arm64.tar.gz"
      sha256 "4044e2ee52362c5ce3b42128885fcd80d99f1f12483eb5b9c80e4109a0d5fae8"
    end

    on_intel do
      url "https://github.com/cosgroveb/dr-charm/releases/download/v0.0.5/dr-charm_0.0.5_darwin_amd64.tar.gz"
      sha256 "37ab7716657c539c61e683404af166e16cfff6e7e40ed37ca17c556383acc3f0"
    end
  end

  def install
    bin.install "dr-charm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dr-charm --version")
  end
end
