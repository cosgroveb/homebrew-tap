class DrCharm < Formula
  desc "DragonRealms terminal client"
  homepage "https://github.com/cosgroveb/dr-charm"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cosgroveb/dr-charm/releases/download/v0.2.0/dr-charm_0.2.0_darwin_arm64.tar.gz"
      sha256 "c41022f2fa8f56237cf1b2eebc7e756360a55bea5a0301039e4624bf18d95c14"
    end

    on_intel do
      url "https://github.com/cosgroveb/dr-charm/releases/download/v0.2.0/dr-charm_0.2.0_darwin_amd64.tar.gz"
      sha256 "9c554e0428758ab7afd38d77ba4d3cbd5ecd95c814aefbc285c63ed10626e850"
    end
  end

  def install
    bin.install "dr-charm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dr-charm --version")
  end
end
