class Guhd < Formula
  desc "Terminal dashboard for Google Workspace and Git repositories"
  homepage "https://github.com/cosgroveb/guhd"
  license "Apache-2.0"

  depends_on "git"
  depends_on :macos
  depends_on "openclaw/tap/gogcli"

  on_macos do
    on_arm do
      url "https://github.com/cosgroveb/guhd/releases/download/v0.1.0/guhd_0.1.0_darwin_arm64.tar.gz"
      sha256 "3465b04035c27cf674d652fa17684abe8898031bf2e4fe03a30da33c83551f66"
    end

    on_intel do
      url "https://github.com/cosgroveb/guhd/releases/download/v0.1.0/guhd_0.1.0_darwin_amd64.tar.gz"
      sha256 "bcfbfa33f0068fad1ce8a437cb431f99709f5ef4d779863878653cb35cc0ea5b"
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
