class DrCharm < Formula
  desc "DragonRealms terminal client"
  homepage "https://github.com/cosgroveb/dr-charm"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cosgroveb/dr-charm/releases/download/v0.2.2/dr-charm_0.2.2_darwin_arm64.tar.gz"
      sha256 "073e34d6383cd2e3a1beeae40c3ec3de44357a7f44dd5f616d6e196a4031a739"
    end

    on_intel do
      url "https://github.com/cosgroveb/dr-charm/releases/download/v0.2.2/dr-charm_0.2.2_darwin_amd64.tar.gz"
      sha256 "1cc4d8e925f0a52defa40320f368871a695c6be3f8cafd39b70f854ca4e389fd"
    end
  end

  def install
    bin.install "dr-charm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dr-charm --version")
  end
end
