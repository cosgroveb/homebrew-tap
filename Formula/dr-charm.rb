class DrCharm < Formula
  desc "DragonRealms terminal client"
  homepage "https://github.com/cosgroveb/dr-charm"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cosgroveb/dr-charm/releases/download/v0.2.7/dr-charm_0.2.7_darwin_arm64.tar.gz"
      sha256 "908a913b90c3579e02aa043c7ee1b14dd696be11e2f4144966babcc042c259c7"
    end

    on_intel do
      url "https://github.com/cosgroveb/dr-charm/releases/download/v0.2.7/dr-charm_0.2.7_darwin_amd64.tar.gz"
      sha256 "acd2fbebd2ab150bb0df435754f5752207ad94823e9618edb4457e7b8d0b5190"
    end
  end

  def install
    bin.install "dr-charm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dr-charm --version")
  end
end
