class Hew < Formula
  desc "Minimal coding agent"
  homepage "https://github.com/cosgroveb/hew"
  url "https://github.com/cosgroveb/hew/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "b1a151e7e78dd50c3828fa424c7bb86bd81ec978bc5456210f62216461e8e508"
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
