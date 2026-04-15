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
      sha256 "07851d104035c402013bece716436fd891778040fe528603b437276eafa49ea7" # x86_mac_sha
    end
    on_arm do
      url "https://github.com/jonaramos/posting-import/releases/download/v#{version}/posting-import-aarch64-apple-darwin.tar.gz"
      sha256 "d1c2e1493b80ba6df8cd4ce07a12c175796d0a96149e329bf4870c948ef16077" # arm_mac_sha
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jonaramos/posting-import/releases/download/v#{version}/posting-import-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "18e4b5c9c2219e463c19d811b9556506e6e0ea31bf65df7d41d069105dd7c1f9" # linux_sha
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

