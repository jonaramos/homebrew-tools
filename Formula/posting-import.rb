# typed: strict
# frozen_string_literal: true
class PostingImport < Formula
  desc "Import API collections from Postman, Insomnia, and Bruno to Posting TUI format"
  homepage "https://github.com/jonaramos/posting-import"
  version "0.1.0"
  license "GPL-3.0-only"

  on_macos do
    on_intel do
      url "https://github.com/jonaramos/posting-import/releases/download/v#{version}/posting-import-x86_64-apple-darwin.tar.gz"
      sha256 "REPLACE_WITH_X86_SHA256" # x86_mac_sha
    end
    on_arm do
      url "https://github.com/jonaramos/posting-import/releases/download/v#{version}/posting-import-aarch64-apple-darwin.tar.gz"
      sha256 "REPLACE_WITH_ARM_SHA256" # arc_mac_sha
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jonaramos/posting-import/releases/download/v#{version}/posting-import-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "REPLACE_WITH_LINUX_SHA256" # linux_sha
    end
  end

  head do
    url "https://github.com/jonaramos/posting-import.git", branch: "main"
    depends_on "rust" => :build
  end

  def install
    bin.install "posting-import"
    man1.install "posting-import.1" if File.exist?("posting-import.1")
    fish_completion.install "posting-import.fish" if File.exist?("posting-import.fish")
    zsh_completion.install "_posting-import" if File.exist?("_posting-import")
    bash_completion.install "posting-import.bash" if File.exist?("posting-import.bash")
  end

  test do
    system "#{bin}/posting-import", "--list-sources"
  end
end

