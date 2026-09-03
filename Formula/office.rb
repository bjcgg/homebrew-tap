class Office < Formula
  desc "office check-in cli"
  homepage "https://github.com/bjcgg/office"
  url "https://github.com/bjcgg/homebrew-tap/releases/download/office-v0.3.4/office-darwin-arm64"
  version "0.3.4"
  license "MIT"
  sha256 "f6a8b8781ca0bba3b0bc9c24569027a65e9a3df2a7e4ec0b356b26760c4709f5"

  on_macos do
    on_intel do
      url "https://github.com/bjcgg/homebrew-tap/releases/download/office-v0.3.4/office-darwin-x64"
      sha256 "9aa02f9ee7da1c72d966f5f570738a47d3e3eb75938f83b38ab90db19b65fa9e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bjcgg/homebrew-tap/releases/download/office-v0.3.4/office-linux-x64"
      sha256 "a2c05b9d648c9657297e2482500fa9fabe6c85f990b6bdd55be11b116dbd7f9f"
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
