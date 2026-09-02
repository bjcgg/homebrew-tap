class Checkin < Formula
  desc "office check-in cli"
  homepage "https://github.com/bjcgg/checkin"
  url "https://github.com/bjcgg/homebrew-tap/releases/download/v0.3.1/checkin-darwin-arm64"
  version "0.3.1"
  license "MIT"
  sha256 "1eba8a81829679ef5f614a48db73cb716c606a7eba5c75a7bf01dc5110e2721f"

  on_macos do
    on_intel do
      url "https://github.com/bjcgg/homebrew-tap/releases/download/v0.3.1/checkin-darwin-x64"
      sha256 "fb98caece866dc58fe012ea48b2eac2e6f39f7bc1f42dcdcea492294a3cb4518"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bjcgg/homebrew-tap/releases/download/v0.3.1/checkin-linux-x64"
      sha256 "0020cf29516d5bff6541d3e70cc96ddce2560919998ccefeb4c4013013c1dd80"
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
