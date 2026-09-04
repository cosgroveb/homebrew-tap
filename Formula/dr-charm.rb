class DrCharm < Formula
  desc "DragonRealms terminal client"
  homepage "https://github.com/cosgroveb/dr-charm"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cosgroveb/dr-charm/releases/download/v0.1.2/dr-charm_0.1.2_darwin_arm64.tar.gz"
      sha256 "3b10a8349b4e2f170e067b8db443a3e879a2711488c885e4b509561d0aa977f5"
    end

    on_intel do
      url "https://github.com/cosgroveb/dr-charm/releases/download/v0.1.2/dr-charm_0.1.2_darwin_amd64.tar.gz"
      sha256 "d533565cea54c4f7e65252434b5df98cc01114dfb7cb0380e60a87ac8fda1de3"
    end
  end

  def install
    bin.install "dr-charm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dr-charm --version")
  end
end
