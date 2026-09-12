class DrCharm < Formula
  desc "DragonRealms terminal client"
  homepage "https://github.com/cosgroveb/dr-charm"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cosgroveb/dr-charm/releases/download/v0.2.9/dr-charm_0.2.9_darwin_arm64.tar.gz"
      sha256 "c621a15184c403f2d0effeb31e8c7ac90ced9e7f1b2cec9f8a2fbd2f0f7fd2b5"
    end

    on_intel do
      url "https://github.com/cosgroveb/dr-charm/releases/download/v0.2.9/dr-charm_0.2.9_darwin_amd64.tar.gz"
      sha256 "fb7718f8fc824e1e7c1251dba2d447ab4674b4e359228eb47e76104d2c8eaef5"
    end
  end

  def install
    bin.install "dr-charm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dr-charm --version")
  end
end
