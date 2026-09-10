class DrCharm < Formula
  desc "DragonRealms terminal client"
  homepage "https://github.com/cosgroveb/dr-charm"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cosgroveb/dr-charm/releases/download/v0.2.6/dr-charm_0.2.6_darwin_arm64.tar.gz"
      sha256 "d2f4d3f1c45abc89bd484640101f8275222ccf4d6703c03b9b81b73ae229df99"
    end

    on_intel do
      url "https://github.com/cosgroveb/dr-charm/releases/download/v0.2.6/dr-charm_0.2.6_darwin_amd64.tar.gz"
      sha256 "d47e8b8501fe552b1f5daa92297059f5e9819923d145398ea11a227368047a20"
    end
  end

  def install
    bin.install "dr-charm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dr-charm --version")
  end
end
