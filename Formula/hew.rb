class Hew < Formula
  desc "Minimal coding agent"
  homepage "https://github.com/cosgroveb/hew"
  url "https://github.com/cosgroveb/hew/archive/refs/tags/v0.4.2.tar.gz"
  sha256 "ffd5b574725834176c6292e85423416c230a14dc9e0aed8c244f143715f8c3e6"
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
