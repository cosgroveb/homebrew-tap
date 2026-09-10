class DrCharm < Formula
  desc "DragonRealms terminal client"
  homepage "https://github.com/cosgroveb/dr-charm"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cosgroveb/dr-charm/releases/download/v0.2.5/dr-charm_0.2.5_darwin_arm64.tar.gz"
      sha256 "f6253dc3d8d78ae2061cd883b29f26326194d61b1464fe63c082f045ab7a4864"
    end

    on_intel do
      url "https://github.com/cosgroveb/dr-charm/releases/download/v0.2.5/dr-charm_0.2.5_darwin_amd64.tar.gz"
      sha256 "5098e569d2cfbfd30e9b87720c34110f0e889c897d163b5557ab518341ea9309"
    end
  end

  def install
    bin.install "dr-charm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dr-charm --version")
  end
end
