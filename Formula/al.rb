class Al < Formula
  desc "Command-line client for AnyList lists"
  homepage "https://github.com/cosgroveb/al"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/cosgroveb/al/releases/download/v0.1.4/al_0.1.4_darwin_arm64.tar.gz"
      sha256 "ef8054decec4357396c302767bccc33283e1f4500d288ffec2c9403bcc3e270a"
    end

    on_intel do
      url "https://github.com/cosgroveb/al/releases/download/v0.1.4/al_0.1.4_darwin_amd64.tar.gz"
      sha256 "7bc6b2e5b33c41f8f45fecf8bb16ee14e3f66a05c97aede57d6bc6f3ef772219"
    end
  end

  def install
    bin.install "al"
    man1.install "man/man1/al.1"
    doc.install "LICENSE", "README.md", "docs", "third-party-licenses"
  end

  test do
    assert_equal "al version #{version}", shell_output("#{bin}/al --version").strip
    assert_match '"ok":true', shell_output("#{bin}/al config show --json")
    assert_path_exists man1/"al.1"
    assert_path_exists doc/"LICENSE"
    assert_path_exists doc/"docs/reference/al.1.md"
    assert_match "ANYLIST_EMAIL", shell_output("MANPATH=#{man} MANPAGER=cat man al").gsub(/.\x08/, "")
  end
end
