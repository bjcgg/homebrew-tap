class Office < Formula
  desc "office check-in cli"
  homepage "https://github.com/bjcgg/office"
  url "https://github.com/bjcgg/homebrew-tap/releases/download/office-v0.3.4/office-darwin-arm64"
  version "0.3.4"
  license "MIT"
  sha256 "da7facfbdea39c2ca8ada62f6843085622247395c06d055cc47ba3174ec8d4bd"

  on_macos do
    on_intel do
      url "https://github.com/bjcgg/homebrew-tap/releases/download/office-v0.3.4/office-darwin-x64"
      sha256 "aabf63b43ec030e01486caf1e67233acbd6933db71e2d3f26a78cdeb3edd9d9d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bjcgg/homebrew-tap/releases/download/office-v0.3.4/office-linux-x64"
      sha256 "e037aea07271aa000b3f6daedbd7fe4914e4371a72c74d29c923de4dbc41ba4d"
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
