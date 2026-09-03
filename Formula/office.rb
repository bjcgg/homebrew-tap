class Office < Formula
  desc "office check-in cli"
  homepage "https://github.com/bjcgg/office"
  url "https://github.com/bjcgg/homebrew-tap/releases/download/office-v0.3.3/office-darwin-arm64"
  version "0.3.3"
  license "MIT"
  sha256 "ac91e0050418c159090c4bc046beea31d76d59b5a75116a420a3b4fe21e68c2e"

  on_macos do
    on_intel do
      url "https://github.com/bjcgg/homebrew-tap/releases/download/office-v0.3.3/office-darwin-x64"
      sha256 "f975d896c8fe449a050bcc860f94c36f053bd0baf4999c90a234830a9ecbdfff"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bjcgg/homebrew-tap/releases/download/office-v0.3.3/office-linux-x64"
      sha256 "c543dc2619324e2079cf8a8f341ef51bf6ef6837b0415c113faabb9dd0a1a46e"
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
