class VultrCli < Formula
    desc "Official command-line tool for Vultr services"
    homepage "https://github.com/vultr/vultr-cli"
    url "https://github.com/vultr/vultr-cli/archive/v0.1.3.tar.gz"
    sha256 "6e35b3e0195b49a86fed6d979d1a3e102ab80a18ac5aa065cd8902a275005779"
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
  