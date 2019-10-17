class VultrCli < Formula
  desc "Official command line tool for Vultr services"
  homepage ""
  url "https://github.com/vultr/vultr-cli/archive/v0.1.8.tar.gz"
  sha256 "6d0d0b1176621c16a78417b90a388968e1ba88c629f78cc665c85b94b80b89c5"
  head "https://github.com/vultr/vultr-cli.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GO111MODULE"] = "on"
    dir = buildpath/"src/github.com/vultr/vultr-cli"
    dir.install buildpath.children

    cd dir do
      system "go", "build", "-o", bin/"vultr-cli", "-ldflags", "-X main.Version=v#{version}"
      prefix.install_metafiles
    end
  end

  test do
    output = shell_output("#{bin}/vultr-cli version 2>&1", 1)
    assert_match "Please export your VULTR API Key", output
  end
end
