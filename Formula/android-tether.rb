class AndroidTether < Formula
  desc "Android USB Tethering for macOS — pure Rust, encrypted DNS, launchd daemon"
  homepage "https://github.com/boukaba/android-tether"
  url "https://github.com/boukaba/android-tether.git", tag: "v2.2.0"
  license "MIT"
  head "https://github.com/boukaba/android-tether.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--root", prefix, "--path", "."
  end

  def caveats
    <<~EOS
      android-tether requires root privileges to run. Use sudo:
        sudo android-tether --watch

      To install as a launchd daemon (auto-start on USB plug):
        sudo android-tether --install --dns-mode doh

      For encrypted DNS:
        sudo android-tether --watch --dns-mode doh
    EOS
  end

  test do
    system "#{bin}/android-tether", "--help"
  end
end
