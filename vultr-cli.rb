# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class VultrCli < Formula
  desc "Official command-line tool for Vultr services"
  homepage "https://github.com/vultr/vultr-cli"
  version "2.6.0"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/vultr/vultr-cli/releases/download/v2.6.0/vultr-cli_2.6.0_macOs_64-bit.tar.gz"
      sha256 "40b6b6c971ee462f90607fa545adff7db042e331e82b7fce37eaedccf83fc68e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/vultr/vultr-cli/releases/download/v2.6.0/vultr-cli_2.6.0_macOs_arm64-bit.tar.gz"
      sha256 "122a47b405bfb0b95093696fd1e4b180ead4d5e58aae797c29bb10c8afcfa320"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/vultr/vultr-cli/releases/download/v2.6.0/vultr-cli_2.6.0_linux_64-bit.tar.gz"
      sha256 "de88b8f5be9931288b2967ff60ad284e3decc26e9782377a26782e516e607f4d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/vultr/vultr-cli/releases/download/v2.6.0/vultr-cli_2.6.0_linux_arm64-bit.tar.gz"
      sha256 "03ef5db0111800fa73954fb917016c8b183063e84743cecff12dc9472a6842e4"
    end
  end

  depends_on "go"

  def install
    bin.install "vultr-cli"
    prefix.install_metafiles
  end

  test do
    output = shell_output("#{bin}/vultr-cli version 2>&1", 1)
    assert_match "Please export your VULTR API key as an environment variable or add `api-key` to your config file, eg:\nexport VULTR_API_KEY='<api_key_from_vultr_account>'\n", output
  end
end
