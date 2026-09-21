class Al < Formula
  desc "Command-line client for AnyList lists"
  homepage "https://github.com/cosgroveb/al"
  license :cannot_represent

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/cosgroveb/al/releases/download/v0.1.0/al_0.1.0_darwin_arm64.tar.gz"
      sha256 "1d47e4ccad51bcbbf4af881b839f34d8c1d4b756b0b7c959099b894c97c708cf"
    end

    on_intel do
      url "https://github.com/cosgroveb/al/releases/download/v0.1.0/al_0.1.0_darwin_amd64.tar.gz"
      sha256 "0682be1fe685eda049fb5f93cef5088002e4daca84878e51c09d701f2f95008e"
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
