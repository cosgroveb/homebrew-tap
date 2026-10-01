class Guhd < Formula
  desc "Terminal dashboard for Google Workspace and Git repositories"
  homepage "https://github.com/cosgroveb/guhd"
  license "Apache-2.0"

  depends_on "git"
  depends_on :macos
  depends_on "openclaw/tap/gogcli"

  on_macos do
    on_arm do
      url "https://github.com/cosgroveb/guhd/releases/download/v0.1.2/guhd_0.1.2_darwin_arm64.tar.gz"
      sha256 "bf31308800185cbceb63c260182352da7f75192b541a5a7bf41e6c492cbaac7f"
    end

    on_intel do
      url "https://github.com/cosgroveb/guhd/releases/download/v0.1.2/guhd_0.1.2_darwin_amd64.tar.gz"
      sha256 "97cd8b50b6cf356f26581285c5cb7ee99ea54417cf99257b5e5946217f0640ff"
    end
  end

  def install
    bin.install "guhd"
    man1.install "man/man1/guhd.1"
    doc.install "LICENSE", "README.md", "copyright", "third-party-licenses"
  end

  test do
    assert_equal "guhd #{version}", shell_output("#{bin}/guhd --version").strip
    assert_match "Google unified heads up display", shell_output("#{bin}/guhd --help")
    assert_path_exists man1/"guhd.1"
    assert_path_exists doc/"LICENSE"
    assert_path_exists doc/"README.md"
    assert_predicate formula_opt_bin("openclaw/tap/gogcli")/"gog", :executable?
  end
end
