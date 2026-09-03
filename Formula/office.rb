class Office < Formula
  desc "office check-in cli"
  homepage "https://github.com/bjcgg/office"
  url "https://github.com/bjcgg/homebrew-tap/releases/download/office-v0.3.0/office-darwin-arm64"
  version "0.3.0"
  license "MIT"
  sha256 "fb68af10201f39feaad5958be5d2a8bff1825d7a0e93d1b5bcc12194f1df4e13"

  on_macos do
    on_intel do
      url "https://github.com/bjcgg/homebrew-tap/releases/download/office-v0.3.0/office-darwin-x64"
      sha256 "5d2dadb84f3ef4242e12b47160f22f79ccbc1dc358d40f4dd4eb0d35b8d3c7b7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bjcgg/homebrew-tap/releases/download/office-v0.3.0/office-linux-x64"
      sha256 "ee47d4485f455a0e0304ba8944e299f769c177e1ead6b93323c9c39f8b61ed96"
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
