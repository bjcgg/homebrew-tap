class Office < Formula
  desc "office check-in cli"
  homepage "https://github.com/bjcgg/office"
  url "https://github.com/bjcgg/homebrew-tap/releases/download/office-v0.1.0/office-darwin-arm64"
  version "0.1.0"
  license "MIT"
  sha256 "566f525bdd9874f69b68ce488c0a7f58d7d2a9a5adccda0d5001953643456ccb"

  on_macos do
    on_intel do
      url "https://github.com/bjcgg/homebrew-tap/releases/download/office-v0.1.0/office-darwin-x64"
      sha256 "04652e5c9da2453baf87675a71e486919c9ad5b6ecce8674ef78d887ecbea86b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bjcgg/homebrew-tap/releases/download/office-v0.1.0/office-linux-x64"
      sha256 "4eb684250e164c42dad767913039968850d00258b2793030a798506ddd90ac7c"
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
