class Guhd < Formula
  desc "Terminal dashboard for Google Workspace and Git repositories"
  homepage "https://github.com/cosgroveb/guhd"
  license "Apache-2.0"

  depends_on "git"
  depends_on :macos
  depends_on "openclaw/tap/gogcli"

  on_macos do
    on_arm do
      url "https://github.com/cosgroveb/guhd/releases/download/v0.2.0/guhd_0.2.0_darwin_arm64.tar.gz"
      sha256 "4de13b9978bc867e6ab59b5705def085947b5f31a622c6890630219b6fc80342"
    end

    on_intel do
      url "https://github.com/cosgroveb/guhd/releases/download/v0.2.0/guhd_0.2.0_darwin_amd64.tar.gz"
      sha256 "37a88b0b513aeb9c78d61d2ea4497f88e860b79ccb57b13c853ec50980976328"
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
