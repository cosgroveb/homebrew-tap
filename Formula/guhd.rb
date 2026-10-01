class Guhd < Formula
  desc "Terminal dashboard for Google Workspace and Git repositories"
  homepage "https://github.com/cosgroveb/guhd"
  license "Apache-2.0"

  depends_on "git"
  depends_on :macos
  depends_on "openclaw/tap/gogcli"

  on_macos do
    on_arm do
      url "https://github.com/cosgroveb/guhd/releases/download/v0.1.1/guhd_0.1.1_darwin_arm64.tar.gz"
      sha256 "d8c07ed59ec44f656920704da930154e58befa0145c7c6487de7c6b5057e20d2"
    end

    on_intel do
      url "https://github.com/cosgroveb/guhd/releases/download/v0.1.1/guhd_0.1.1_darwin_amd64.tar.gz"
      sha256 "79334014d212a8adc593b67ad443fdbc67085398141650699139ea124dd83aba"
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
