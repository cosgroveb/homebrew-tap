class Hew < Formula
  desc "Minimal coding agent"
  homepage "https://github.com/cosgroveb/hew"
  url "https://github.com/cosgroveb/hew/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "4c8c4f48e341674fde70d5e0dfe33d8d0ec886f3f04d7f823eb47d37af679bdb"
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
