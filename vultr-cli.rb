# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class VultrCli < Formula
  desc "Official command-line tool for Vultr services"
  homepage "https://github.com/vultr/vultr-cli"
  version "3.5.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/vultr/vultr-cli/releases/download/v3.5.0/vultr-cli_v3.5.0_macOs_amd64.tar.gz"
      sha256 "1dc620c9312992b816d4f7aa306b3cc4a7ad4f3800331a9c55f5ff80c4141cef"

      def install
        bin.install "vultr-cli"
        prefix.install_metafiles
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/vultr/vultr-cli/releases/download/v3.5.0/vultr-cli_v3.5.0_macOs_arm64.tar.gz"
      sha256 "7e2bf232f3cde9aa97c5069e63b6f7b701c134bdf749c68e05349f8f5425674d"

      def install
        bin.install "vultr-cli"
        prefix.install_metafiles
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/vultr/vultr-cli/releases/download/v3.5.0/vultr-cli_v3.5.0_linux_amd64.tar.gz"
      sha256 "db320a3d4f0ceef8a385313f7c2e7c472d73899ddf460b5201b0a557591c0d11"
      def install
        bin.install "vultr-cli"
        prefix.install_metafiles
      end
    end
    if Hardware::CPU.arm? and !Hardware::CPU.is_64_bit?
      url "https://github.com/vultr/vultr-cli/releases/download/v3.5.0/vultr-cli_v3.5.0_linux_arm32-v6.tar.gz"
      sha256 "b997330fad985e4261d6127884fd35c933a15110601ed9273ef95876c7052385"
      def install
        bin.install "vultr-cli"
        prefix.install_metafiles
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/vultr/vultr-cli/releases/download/v3.5.0/vultr-cli_v3.5.0_linux_arm64.tar.gz"
      sha256 "1b88fdd9b9ad4508b3b2943ba7edae230d07ebbfee4735eb09fe2acc82eff552"
      def install
        bin.install "vultr-cli"
        prefix.install_metafiles
      end
    end
  end

  test do
    output = shell_output("#{bin}/vultr-cli version 2>&1", 1)
    assert_match "Please export your VULTR API key as an environment variable or add `api-key` to your config file, eg:\nexport VULTR_API_KEY='<api_key_from_vultr_account>'\n", output
  end
end
