class DrCharm < Formula
  desc "DragonRealms terminal client"
  homepage "https://github.com/cosgroveb/dr-charm"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cosgroveb/dr-charm/releases/download/v0.1.0/dr-charm_0.1.0_darwin_arm64.tar.gz"
      sha256 "591b4e7ef60c79ffd5694d44473855d6cedff3c07cd6d153f62c46ba6f0c6a9b"
    end

    on_intel do
      url "https://github.com/cosgroveb/dr-charm/releases/download/v0.1.0/dr-charm_0.1.0_darwin_amd64.tar.gz"
      sha256 "d6f79ec27c210dabcc289eeb7801339e6d17a5c6c347ec49c7e1fe94f6f2eb3b"
    end
  end

  def install
    bin.install "dr-charm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dr-charm --version")
  end
end
