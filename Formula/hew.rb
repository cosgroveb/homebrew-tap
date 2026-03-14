class Hew < Formula
  desc "Minimal coding agent"
  homepage "https://github.com/cosgroveb/hew"
  url "https://github.com/cosgroveb/hew/archive/refs/tags/v0.5.4.tar.gz"
  sha256 "2c862bba34b2114f408ba4fe8143cb4747e24de58ab1b652f346f067d9bbb2b6"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"

    # Plain CLI (stdlib only)
    system "go", "build", *std_go_args(output: bin/"hu", ldflags: ldflags), "./cmd/hu/"

    # TUI (charm deps, own go.mod)
    Dir.chdir("cmd/hew") do
      system "go", "build", *std_go_args(output: bin/"hew", ldflags: ldflags), "."
    end

    man1.install "doc/hew.1"
    man1.install "doc/hu.1"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hu --version")
    assert_match version.to_s, shell_output("#{bin}/hew --version")
  end
end
