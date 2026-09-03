class Office < Formula
  desc "office check-in cli"
  homepage "https://github.com/bjcgg/office"
  url "https://github.com/bjcgg/homebrew-tap/releases/download/office-v0.3.1/office-darwin-arm64"
  version "0.3.1"
  license "MIT"
  sha256 "218e41e3881ea98f7ad62f82ff44e4c8a500d87b7aa541facf92c5d2ea103c40"

  on_macos do
    on_intel do
      url "https://github.com/bjcgg/homebrew-tap/releases/download/office-v0.3.1/office-darwin-x64"
      sha256 "b511a9f43fc73fcd7cfa48ccf6760c59bb5784c904ece8ad6bebeaf3debb6c2e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bjcgg/homebrew-tap/releases/download/office-v0.3.1/office-linux-x64"
      sha256 "45d007037bbc92662cde695410562ca1b6fc516f08f643abe70bb804c42d2a1e"
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
