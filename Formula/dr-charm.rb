class DrCharm < Formula
  desc "DragonRealms terminal client"
  homepage "https://github.com/cosgroveb/dr-charm"
  version "0.0.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cosgroveb/dr-charm/releases/download/v0.0.6/dr-charm_0.0.6_darwin_arm64.tar.gz"
      sha256 "140c263286b524b16ba8292b311e560ed704c4e53028c69463110e3436c8c00a"
    end

    on_intel do
      url "https://github.com/cosgroveb/dr-charm/releases/download/v0.0.6/dr-charm_0.0.6_darwin_amd64.tar.gz"
      sha256 "d411c318d915d560fe63a173da523d015b0f863a530b88651e092e51a9d42564"
    end
  end

  def install
    bin.install "dr-charm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dr-charm --version")
  end
end
