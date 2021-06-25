class CarthageAT001 < Formula
  desc "Decentralized dependency manager for Cocoa"
  homepage "https://github.com/Carthage/Carthage"
  url "https://github.com/Nextdoor/Carthage/archive/0.36.0-0.0.1.zip"
  license "MIT"
  head "https://github.com/Nextdoor/Carthage.git"

  bottle do
    root_url "https://github.com/Nextdoor/Carthage/releases/download/0.36.0-0.0.1"
    sha256 cellar: :any, catalina: "067440f6b9f8ab59daa3952f19ff6e9919e15db582d541d33f45eff83b880b12"
  end

  depends_on xcode: ["10.0", :build]

  def install
    system "make", "prefix_install", "PREFIX=#{prefix}"
    bash_completion.install "Source/Scripts/carthage-bash-completion" => "carthage"
    zsh_completion.install "Source/Scripts/carthage-zsh-completion" => "_carthage"
    fish_completion.install "Source/Scripts/carthage-fish-completion" => "carthage.fish"
  end

  test do
    (testpath/"Cartfile").write 'github "jspahrsummers/xcconfigs"'
    system bin/"carthage", "update"
  end
end
