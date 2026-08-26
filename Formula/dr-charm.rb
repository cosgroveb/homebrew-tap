class DrCharm < Formula
  desc "DragonRealms terminal client"
  homepage "https://github.com/cosgroveb/dr-charm"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cosgroveb/dr-charm/releases/download/v0.0.1/dr-charm_0.0.1_darwin_arm64.tar.gz"
      sha256 "041edf2ca38c2b7b2b55172ff8d00d0fd71d2220858ba1fce8f92f93e136efc6"
    end

    on_intel do
      url "https://github.com/cosgroveb/dr-charm/releases/download/v0.0.1/dr-charm_0.0.1_darwin_amd64.tar.gz"
      sha256 "8b942a67155f9f4463980245a13b1c9b8bcac678c365929c0c856075867525ca"
    end
  end

  def install
    bin.install "dr-charm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dr-charm -version")
  end
end
