class DrCharm < Formula
  desc "DragonRealms terminal client"
  homepage "https://github.com/cosgroveb/dr-charm"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cosgroveb/dr-charm/releases/download/v0.2.8/dr-charm_0.2.8_darwin_arm64.tar.gz"
      sha256 "fdee7c025fb053da77b29f578e75ee60c498b8520d0261aeb68eda7f79ac3427"
    end

    on_intel do
      url "https://github.com/cosgroveb/dr-charm/releases/download/v0.2.8/dr-charm_0.2.8_darwin_amd64.tar.gz"
      sha256 "77d3902da6ab1fb53529c260bb196b9232e6af5ce73cba9f7294bdf6a9f0d16e"
    end
  end

  def install
    bin.install "dr-charm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dr-charm --version")
  end
end
