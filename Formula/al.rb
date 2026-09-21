class Al < Formula
  desc "Command-line client for AnyList lists"
  homepage "https://github.com/cosgroveb/al"
  license :cannot_represent

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/cosgroveb/al/releases/download/v0.1.2/al_0.1.2_darwin_arm64.tar.gz"
      sha256 "8421ae5c3897131909e5effed38c2f061771b98f1a0a6c9336bcb098f96d6feb"
    end

    on_intel do
      url "https://github.com/cosgroveb/al/releases/download/v0.1.2/al_0.1.2_darwin_amd64.tar.gz"
      sha256 "f50e5316f981f518faae405294548822fb43b8181b34e6a6a78ac85f00bc014e"
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
