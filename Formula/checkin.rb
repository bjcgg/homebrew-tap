class Checkin < Formula
  desc "office check-in cli"
  homepage "https://github.com/bjcgg/checkin"
  url "https://github.com/bjcgg/homebrew-tap/releases/download/v0.2.0/checkin-darwin-arm64"
  version "0.2.0"
  license "MIT"
  sha256 "2a6c497486bd91467514ae7d596b4dbd3f64f87802c2d924402b91bb49b7fd19"

  on_macos do
    on_intel do
      url "https://github.com/bjcgg/homebrew-tap/releases/download/v0.2.0/checkin-darwin-x64"
      sha256 "8f6d3b0c8111af1be681c186d4d995f33953bd0004bb62eb80e04bdbd4a9e200"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bjcgg/homebrew-tap/releases/download/v0.2.0/checkin-linux-x64"
      sha256 "e0fcedd0da55589a0327356eda76ca4e30c877305a9b1473025fd61cf051563f"
    end
  end

  def install
    binary = Dir["checkin-*"].first
    bin.install binary => "checkin"
  end

  test do
    assert_match "usage", shell_output("#{bin}/checkin 2>&1", 2)
  end
end
