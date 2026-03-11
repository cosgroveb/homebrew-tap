class Hew < Formula
  desc "Minimal coding agent"
  homepage "https://github.com/cosgroveb/hew"
  url "https://github.com/cosgroveb/hew/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "f30c9addb3b1e5e804aab033fc5a10e820c38520ebfae825436a330bc2616f60"
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
