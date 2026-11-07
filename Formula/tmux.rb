class Tmux < Formula
  desc "Terminal multiplexer with personal OSC7501 patches"
  homepage "https://github.com/cosgroveb/tmux"
  url "https://github.com/cosgroveb/tmux/releases/download/personal-2026.11.7.7.1/tmux-2026.11.7.7.1.tar.gz"
  sha256 "29838dee0ce3352ab910890cd6e6277b4a352a2d22c86c7940815ce7e2a043d2"
  license "ISC"

  bottle do
    root_url "https://github.com/cosgroveb/tmux/releases/download/personal-2026.11.7.7.1"
    sha256 cellar: :any, arm64_tahoe: "2a2f7fd2661a94b91d3aa76e1be1a9c9fbfdb60455d63d015f3a7a4debae42d1"
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "pkgconf" => :build
  depends_on "jemalloc"
  depends_on "libevent"
  depends_on macos: :tahoe
  depends_on "ncurses"
  depends_on "utf8proc"

  def install
    system "sh", "autogen.sh"
    system "./configure", "--prefix=#{prefix}", "--enable-utf8proc", "--enable-jemalloc"
    system "make", "install"
    pkgshare.install "COPYING"
    (pkgshare/"personal-build.json").write <<~JSON
      {"source_sha":"b59c6b6d309e99e79d9f6c666cbe3c2164bb888c","upstream_sha":"7f2a35ad3321f9ba57a1062ca73b1f3ff26aca53","version":"2026.11.7.7.1","target":"macos-26-arm64"}
    JSON
  end

  test do
    assert_equal "tmux 3.8", shell_output("#{bin}/tmux -V").strip
    identity = JSON.parse((pkgshare/"personal-build.json").read)
    assert_equal version.to_s, identity.fetch("version")
    assert_equal "b59c6b6d309e99e79d9f6c666cbe3c2164bb888c", identity.fetch("source_sha")
  end
end
