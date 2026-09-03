class Office < Formula
  desc "office check-in cli"
  homepage "https://github.com/bjcgg/office"
  url "https://github.com/bjcgg/homebrew-tap/releases/download/office-v0.3.2/office-darwin-arm64"
  version "0.3.2"
  license "MIT"
  sha256 "f7ce263e09f225b34a77f2b84bb30692c728120c79abe3b67c504bb1b113c095"

  on_macos do
    on_intel do
      url "https://github.com/bjcgg/homebrew-tap/releases/download/office-v0.3.2/office-darwin-x64"
      sha256 "d9626864a0451cfdd4a2ae6d53dda0ab0bb0b30e19cde96d278663529e5abc93"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bjcgg/homebrew-tap/releases/download/office-v0.3.2/office-linux-x64"
      sha256 "c9988f3fbd9eadf87291cc06f8f5fea74c0879896bf6afbad4452106a61881df"
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
