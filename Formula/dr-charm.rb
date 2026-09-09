class DrCharm < Formula
  desc "DragonRealms terminal client"
  homepage "https://github.com/cosgroveb/dr-charm"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cosgroveb/dr-charm/releases/download/v0.2.4/dr-charm_0.2.4_darwin_arm64.tar.gz"
      sha256 "a732f4bca1892ce52781a992ce8d849c40421601ff2545c9632ea410a84b49dc"
    end

    on_intel do
      url "https://github.com/cosgroveb/dr-charm/releases/download/v0.2.4/dr-charm_0.2.4_darwin_amd64.tar.gz"
      sha256 "057bb62af3bd2830c88ff281e129825b1445110f3466e0c997f5067abfcb674c"
    end
  end

  def install
    bin.install "dr-charm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dr-charm --version")
  end
end
