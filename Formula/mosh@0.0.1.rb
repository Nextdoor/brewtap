class MoshAT001 < Formula
  desc "Remote terminal application"
  homepage "https://mosh.org"

  head "https://github.com/Nextdoor/mosh.git", :revision => "7d0ce3209959462a6c281cd7a1a8a314296f8789"
  head do
    url "https://github.com/Nextdoor/mosh.git", :shallow => false

    depends_on "autoconf" => :build
    depends_on "automake" => :build
  end

  depends_on "pkg-config" => :build
  depends_on "tmux" => :build
  depends_on "protobuf"

  def install
    ENV.cxx11

    # teach mosh to locate mosh-client without referring
    # PATH to support launching outside shell e.g. via launcher
    inreplace "scripts/mosh.pl", "'mosh-client", "\'#{bin}/mosh-client"

    system "./autogen.sh" if build.head?
    system "./configure", "--prefix=#{prefix}", "--enable-completion"
    system "make", "install"
  end

  test do
    system bin/"mosh-client", "-c"
  end
end
