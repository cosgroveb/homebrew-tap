class Al < Formula
  desc "Command-line client for AnyList lists"
  homepage "https://github.com/cosgroveb/al"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/cosgroveb/al/releases/download/v0.1.3/al_0.1.3_darwin_arm64.tar.gz"
      sha256 "4a7b926ea9427320ea255323ba53fad729862ba7fd5f6dd3ba6787865da9c129"
    end

    on_intel do
      url "https://github.com/cosgroveb/al/releases/download/v0.1.3/al_0.1.3_darwin_amd64.tar.gz"
      sha256 "8a41d315704fd13f9c342e03757950c3393344253a2405d1b3ebf4b14a9601dd"
    end
  end

  def install
    bin.install "al"
    man1.install "man/man1/al.1"
    doc.install "LICENSE", "README.md", "docs", "THIRD_PARTY_NOTICES.md", "third-party-licenses"
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
