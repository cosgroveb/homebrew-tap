class Hew < Formula
  desc "Minimal coding agent"
  homepage "https://github.com/cosgroveb/hew"
  url "https://github.com/cosgroveb/hew/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "63375184b93a7ee0820ca5fa620899bd21172202a562e48976f0089b7c204e96"
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
