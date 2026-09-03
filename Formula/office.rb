class Office < Formula
  desc "office check-in cli"
  homepage "https://github.com/bjcgg/office"
  url "https://github.com/bjcgg/homebrew-tap/releases/download/office-v0.3.4/office-darwin-arm64"
  version "0.3.4"
  license "MIT"
  sha256 "eccacb2a28607b99fd23c81475e831a2e46e344f74afb100d7fef77db4c8c593"

  on_macos do
    on_intel do
      url "https://github.com/bjcgg/homebrew-tap/releases/download/office-v0.3.4/office-darwin-x64"
      sha256 "f5b2f0f42ac4595ccf22711ecc878116584abdb5fc5d89524c8df252c50ff3ae"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bjcgg/homebrew-tap/releases/download/office-v0.3.4/office-linux-x64"
      sha256 "22866abf9fc10e3130810d60420b5b448b9bfc391aabfb06f2b2e69ebc12f923"
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
