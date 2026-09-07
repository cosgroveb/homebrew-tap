class DrCharm < Formula
  desc "DragonRealms terminal client"
  homepage "https://github.com/cosgroveb/dr-charm"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cosgroveb/dr-charm/releases/download/v0.1.3/dr-charm_0.1.3_darwin_arm64.tar.gz"
      sha256 "5cd23d0fbfac33301340c4d5629dc94e9041740e39b23b72297e82cda0e0d6f0"
    end

    on_intel do
      url "https://github.com/cosgroveb/dr-charm/releases/download/v0.1.3/dr-charm_0.1.3_darwin_amd64.tar.gz"
      sha256 "203c6f37af66cd55ee16d6675bbdaf0718eb6eb847ba9c581798fd623d27fab5"
    end
  end

  def install
    bin.install "dr-charm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dr-charm --version")
  end
end
