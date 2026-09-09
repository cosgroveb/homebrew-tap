class DrCharm < Formula
  desc "DragonRealms terminal client"
  homepage "https://github.com/cosgroveb/dr-charm"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cosgroveb/dr-charm/releases/download/v0.2.3/dr-charm_0.2.3_darwin_arm64.tar.gz"
      sha256 "409600cf2a9f24b4ea1580bae45dafcf90f4ffaed832d1cefca411cae2b7421c"
    end

    on_intel do
      url "https://github.com/cosgroveb/dr-charm/releases/download/v0.2.3/dr-charm_0.2.3_darwin_amd64.tar.gz"
      sha256 "8cc467e479b3bdff7369eb5dad00d8ba59c3745631ffb844d0aeaa6a7d34e3f6"
    end
  end

  def install
    bin.install "dr-charm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dr-charm --version")
  end
end
