class VultrCli < Formula
    desc "Official command-line tool for Vultr services"
    homepage "https://github.com/vultr/vultr-cli"
    url "https://github.com/vultr/vultr-cli/archive/v0.1.4.tar.gz"
    sha256 "78e63e2636c623d9bdaf64664e87a354b76ab28bd83ac71f8fb26ff5ac224537"
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
  