class Office < Formula
  desc "office check-in cli"
  homepage "https://github.com/bjcgg/office"
  url "https://github.com/bjcgg/homebrew-tap/releases/download/office-v0.2.0/office-darwin-arm64"
  version "0.2.0"
  license "MIT"
  sha256 "1db2805d00683b7976776159bfb763f214230f1ee48f70570aca79f78465d586"

  on_macos do
    on_intel do
      url "https://github.com/bjcgg/homebrew-tap/releases/download/office-v0.2.0/office-darwin-x64"
      sha256 "5b182810bace92777d1fc235e4cfd7c406dcc64fbbd36a0741e944cbb22671e3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bjcgg/homebrew-tap/releases/download/office-v0.2.0/office-linux-x64"
      sha256 "28f5a8b4d31866c00c6c7bd269675bf9db6d3132622b3a9f44c455dcd78d542d"
    end
  end

  def install
    binary = Dir["office-*"].first
    bin.install binary => "office"
  end

  test do
    assert_match "usage", shell_output("#{bin}/office 2>&1", 2)
  end
end
