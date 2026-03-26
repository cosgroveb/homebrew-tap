class Hew < Formula
  desc "Minimal coding agent"
  homepage "https://github.com/cosgroveb/hew"
  url "https://github.com/cosgroveb/hew/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "ded9604f6c0b6e1fd447e0677b4c3b3db6370be690fab999697a3d029a5b4309"
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
