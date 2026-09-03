class Timecard < Formula
  desc "timecard check-in cli"
  homepage "https://github.com/bjcgg/timecard"
  url "https://github.com/bjcgg/homebrew-tap/releases/download/timecard-v0.1.0/timecard-darwin-arm64"
  version "0.1.0"
  license "MIT"
  sha256 "df767cd05263dad1f2a5543c972dec39f5aca0999273852d97b12ba168446137"

  on_macos do
    on_intel do
      url "https://github.com/bjcgg/homebrew-tap/releases/download/timecard-v0.1.0/timecard-darwin-x64"
      sha256 "9fc67a1752fd1a1836aab11a5861634743e87717ce017f8fe75e0b40d63b6740"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/bjcgg/homebrew-tap/releases/download/timecard-v0.1.0/timecard-linux-x64"
      sha256 "de98aced8d7c16342f4f117b780320eb1954bbaafca4655fa402f1cd04941886"
    end
  end

  def install
    binary = Dir["timecard-*"].first
    bin.install binary => "timecard"
  end

  test do
    assert_match "usage", shell_output("#{bin}/timecard 2>&1", 2)
  end
end
