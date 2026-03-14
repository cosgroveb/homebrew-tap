class Hew < Formula
  desc "Minimal coding agent"
  homepage "https://github.com/cosgroveb/hew"
  url "https://github.com/cosgroveb/hew/archive/refs/tags/v0.5.5.tar.gz"
  sha256 "e5719c5c4d5c0ca0a6fbc055bcb0d69a1dcdb43bb34919e9c067cbab830b441f"
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
