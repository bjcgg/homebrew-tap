class Gate < Formula
  desc "repo access preflight cli"
  homepage "https://github.com/bjcgg/gate"
  url "https://github.com/bjcgg/homebrew-tap/releases/download/gate-v0.1.0/gate-darwin-arm64"
  version "0.1.0"
  license "MIT"
  sha256 "b310e2bf00c9e925e3a63dd9c49fad613c365d23a1f52ec51e9c8c75817f676d"

  on_macos do
    on_intel do
      url "https://github.com/bjcgg/homebrew-tap/releases/download/gate-v0.1.0/gate-darwin-x64"
      sha256 "3de6f87870de0294050068b16838cc5e28b41016596d296759ee684148335ede"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bjcgg/homebrew-tap/releases/download/gate-v0.1.0/gate-linux-x64"
      sha256 "0b8428eb6d0f594ac5bac13fb5e3044fe5c1af2ec8730373598d933c69352e3a"
    end
  end

  def install
    binary = Dir["gate-*"].first
    bin.install binary => "gate"
  end

  test do
    assert_match "usage", shell_output("#{bin}/gate 2>&1", 2)
  end
end
