class Checkin < Formula
  desc "office check-in cli"
  homepage "https://github.com/bjcgg/checkin"
  url "https://github.com/bjcgg/homebrew-tap/releases/download/v0.3.0/checkin-darwin-arm64"
  version "0.3.0"
  license "MIT"
  sha256 "eadd446d02caae2237da42e332b84e6df6c678be2b4f178704f0fe1e6b190a20"

  on_macos do
    on_intel do
      url "https://github.com/bjcgg/homebrew-tap/releases/download/v0.3.0/checkin-darwin-x64"
      sha256 "0f5a85b6b474e87c8a8052eb8b3c04618189df65c5bd4db4e21ef59056b3fd8b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bjcgg/homebrew-tap/releases/download/v0.3.0/checkin-linux-x64"
      sha256 "6804db333f8adc1977412622a5383ac41c5549936c2fa984d9ee3f9f46271e5c"
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
