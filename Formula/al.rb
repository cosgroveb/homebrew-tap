class Al < Formula
  desc "Command-line client for AnyList lists"
  homepage "https://github.com/cosgroveb/al"
  license :cannot_represent

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/cosgroveb/al/releases/download/v0.1.1/al_0.1.1_darwin_arm64.tar.gz"
      sha256 "b0303c81fea8d02066443ed37b5c74edb93c4dd4530df35fb5dc91fb5f9bb8c0"
    end

    on_intel do
      url "https://github.com/cosgroveb/al/releases/download/v0.1.1/al_0.1.1_darwin_amd64.tar.gz"
      sha256 "a45ef732e2b05b40188af3e856ebc376e531d839555a2b9a10d8a734661dd338"
    end
  end

  def install
    bin.install "al"
    man1.install "man/man1/al.1"
    doc.install "README.md", "docs", "THIRD_PARTY_NOTICES.md", "third-party-licenses"
  end

  test do
    assert_equal "al version #{version}", shell_output("#{bin}/al --version").strip
    assert_match '"ok":true', shell_output("#{bin}/al config show --json")
    assert_path_exists man1/"al.1"
    assert_path_exists doc/"docs/reference/al.1.md"
    assert_match "ANYLIST_EMAIL", shell_output("MANPATH=#{man} MANPAGER=cat man al").gsub(/.\x08/, "")
  end
end
