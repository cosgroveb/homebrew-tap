class Hew < Formula
  desc "Minimal coding agent"
  homepage "https://github.com/cosgroveb/hew"
  url "https://github.com/cosgroveb/hew/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "be24502c8875fd56fc884de7043af6d180f7b7f2318b53153748acf285cbdf96"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/hew/"
    man1.install "doc/hew.1"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hew --version")
  end
end
