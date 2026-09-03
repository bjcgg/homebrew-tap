class Office < Formula
  desc "office check-in cli"
  homepage "https://github.com/bjcgg/office"
  url "https://github.com/bjcgg/homebrew-tap/releases/download/office-v0.3.3/office-darwin-arm64"
  version "0.3.3"
  license "MIT"
  sha256 "52d96ed03706f5dc8ae5994e752a770dd1ef9c3b77fe4c8de62a506acfe86a09"

  on_macos do
    on_intel do
      url "https://github.com/bjcgg/homebrew-tap/releases/download/office-v0.3.3/office-darwin-x64"
      sha256 "1d0666a6043862730402dd0ecd55c6f39300c082501f46ffb5dfd94d56e46a61"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bjcgg/homebrew-tap/releases/download/office-v0.3.3/office-linux-x64"
      sha256 "b6c98ff0f21c4e6854622d4b40500a6a3b67d07e278845f1b515a64db9a91e6b"
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
