class Checkin < Formula
  desc "office check-in cli"
  homepage "https://github.com/bjcgg/checkin"
  url "https://github.com/bjcgg/checkin/releases/download/v0.1.0/checkin-darwin-arm64"
  version "0.1.0"
  license "MIT"
  sha256 "098413884dcb492ade7db7390daed5ac5af8a58d2a4d0aa8a1ecbe05f51f2faa"

  on_macos do
    on_intel do
      url "https://github.com/bjcgg/checkin/releases/download/v0.1.0/checkin-darwin-x64"
      sha256 "9d1b0cb649036aef5740857c3194d605424934bbc7597b9805b4dc3a508ab6cf"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bjcgg/checkin/releases/download/v0.1.0/checkin-linux-x64"
      sha256 "0a72fd338ba91605cd8ab5c5e43857f1f6e2792491d6a241685f457cc95bdc49"
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
